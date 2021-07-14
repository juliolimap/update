class PLUS
{
	static VERSION = 0.92

	// We have to make a clone of fe table before overriding fe. functions
	static FE = clone fe

	// Global tables
	static PLUS_INSTANCES = []
	static Drawables = {}
	static Functions = {}

	// Preparing context for local variables
	constructor()
	{
		locals.object <- ::PLUS.Null()
		locals = clone locals
		properties = clone properties
	}

	function init()
	{
		// Sanity check to determine whether the Plus module was placed
		// on top of the layout code.
		if ( fe.obj.len() > 0 )
			return false

		const DRW_DIR = "plus/drawables/"
		const FNC_DIR = "plus/functions/"

		foreach ( file in zip_get_dir( fe.module_dir + DRW_DIR ))
			if ( ends_with( file, ".nut" ))
				fe.do_nut( fe.module_dir + DRW_DIR + file )

		foreach ( file in zip_get_dir( fe.module_dir + FNC_DIR ))
			if ( ends_with( file, ".nut" ))
				fe.do_nut( fe.module_dir + FNC_DIR + file )

		::fe.add_ticks_callback( this, "tick" )
		::fe.add_transition_callback( this, "transition" )

		// Adding drawable initializer functions to fe
		foreach ( name, drawable in Drawables )
		{
			::fe["add_" + name] <- function(...)
			{
				local inst = PLUS.Drawables[::PLUS.get_callee_name( ::fe, ::callee() )].instance()
				::PLUS.Drawable.constructor.call( inst, ::PLUS.FE, vargv )
				return inst
			}
		}

		::fe["add_clone"] <- function( source )
		{
			local inst = clone source
			inst.locals = clone source.locals
			inst.properties = clone source.properties
			inst.locals.object = ::PLUS.FE.add_clone(source.locals.object)
			inst.functions = clone source.functions
			foreach ( n, f in inst.functions )
			{
				inst.functions[n] = clone source.functions[n]
				inst.functions[n].locals = clone source.functions[n].locals
				inst.functions[n].properties = clone source.functions[n].properties
				inst.functions[n].locals.object = inst.locals.object
			}
			::PLUS.PLUS_INSTANCES.push( inst )
			return inst
		}

		::fe["add_shader"] <- function(...)	{ return ::PLUS.Shader( vargv )	}
		::fe["overlay"] <- ::PLUS.Overlay()

		return true
	}

	function tick( ttime )
	{
		foreach ( inst in PLUS_INSTANCES )
		{
			if ( "onTick" in inst )
				inst.onTick.call( inst.locals, ttime )

			foreach ( func in inst.functions )
				if ( "onTick" in func )
					func.onTick.call( func.locals, ttime )
		}
	}
	function transition( ttype, var, ttime )
	{
		foreach ( inst in PLUS_INSTANCES )
		{
			if ( "onTransition" in inst )
				inst.onTransition.call( inst.locals, ttype, var, ttime )

			foreach ( func in inst.functions )
				if ( "onTransition" in func )
					func.onTransition.call( func.locals, ttype, var, ttime )
		}
	}
}

class PLUS.Drawable extends PLUS
{
	// Table of functions assigned to each PLUS Drawable
	functions = null

	constructor( parent, vargv )
	{
		locals.shader <- ::PLUS.Null()
		functions = {}
		base.constructor()
		PLUS_INSTANCES.push( this )

		foreach ( k, v in properties ) locals.rawset( k, v )
		onAdd.call( locals, parent, vargv )

		if ( this.getclass() == ::PLUS.Drawables["surface"] )
		{
			foreach ( name, func in Drawables )
			{
				this.getclass().newmember( "add_" + name, function(...)
				{
					local func_name = ::PLUS.get_callee_name( this.getclass(), ::callee() )
					local inst = ::PLUS.Drawables[func_name].instance()
					::PLUS.Drawable.constructor.call( inst, object, vargv )
					return inst
				})
			}
			this.getclass().newmember("add_clone", function( source )
			{
				local inst = clone source
				inst.locals = clone source.locals
				inst.properties = clone source.properties
				inst.locals.object = object.add_clone( source.locals.object )
				inst.functions = clone source.functions
				foreach ( n, f in inst.functions )
				{
					inst.functions[n] = clone source.functions[n]
					inst.functions[n].locals = clone source.functions[n].locals
					inst.functions[n].properties = clone source.functions[n].properties
					inst.functions[n].locals.object = inst.locals.object
				}
				::PLUS.PLUS_INSTANCES.push( inst )
				return inst
			})
		}

		foreach ( name, func in Functions )
		{
			this.getclass().newmember( "add_" + name, function(...)
			{
				local func_name = ::PLUS.get_callee_name( this.getclass(), ::callee() )
				local inst = ::PLUS.Functions[func_name].instance()
				::PLUS.Function.constructor.call( inst, this, vargv )
				this.functions[func_name] <- inst
			})
		}
	}

	function _get( idx )
	{
		if ( idx == "shader" )
		{
			if ( locals.shader.rawin("shaderobj") )
				return locals.shader
			else
				return ::PLUS.Shader.empty
		}

		if ( idx == "object" )
			return locals.object

		foreach ( func in functions )
			if ( idx in func.properties )
				return func.locals[idx]

		if ( idx in properties )
			return locals[idx]

		return locals.object[idx]
	}

	function _set( idx, val )
	{
		// ::print(idx+" "+val+" "+"\n")
		if ( idx == "shader" )
		{
			// ::print ( "RAWIN_SET____: "+val.rawin("shaderobj")+"\n")
			locals.shader = val
			// ::print(idx+" "+val.getclass()+" "+val.shaderobj+"\n")
			// val.shaderobj.set_param("a",1,2)
			locals.object.shader = locals.shader.shaderobj
			return
		}

		foreach ( func in functions )
			if ( idx in func.properties )
			{
				func.locals[idx] = val
				return
			}

		if ( idx in properties )
			locals[idx] = val
		else
			locals.object[idx] = val
	}
}

class PLUS.Function extends PLUS
{
	constructor( drawable, vargv )
	{
		base.constructor()
		locals.object = drawable
		foreach ( k, v in properties ) locals.rawset( k, v )
		onAdd.call( locals, vargv )
	}
}

// This function retrieves the class name from the function's name
function PLUS::get_callee_name( context, callee )
{
	foreach ( name, func in context )
		if ( typeof func == "function" )
			if ( callee == func )
				return name.slice(4)
	throw "Function not found." // This should not fail
}

// Checks if the name ends with a given string
function PLUS::ends_with( name, string )
{
	if ( name.slice( name.len() - string.len(), name.len()) == string )
		return true
	else
		return false
}

class PLUS.Null {}

if ( !PLUS.init() ) throw "PLUS: Module failed to load. Make sure load_module(\"plus\") is placed on top of the layout code."
