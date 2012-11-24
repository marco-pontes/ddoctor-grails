package ddoctor

import org.springframework.web.servlet.support.RequestContextUtils as RCU

class DdoctorTagLib {

	static namespace = "ddoctor"

	def breadcrumb = { attrs ->
		def item = [:]
		if(!session['breadcrumb'] || attrs.reset == "true"){
			session['breadcrumb'] = []
		}
		out << """<div class="page-title">
					<h1>${attrs.pagina}</h1>"""
		out << "<span>"
		item = [pagina:attrs.pagina, actionName:actionName, controllerName:controllerName, id:params.id]
		if (!session['breadcrumb'].contains(item)){
			session['breadcrumb'].add(item)
		}
		for (crumb in session['breadcrumb']){
			if (crumb != item && crumb != null){
				out << "${link(controller:crumb.controllerName, action:crumb.actionName) {crumb.pagina} } > "
			}
		}
		out << """${attrs.pagina}"""
		out << """</span>
				</div>"""
	}
	
	/**
	* Creates next/previous links to support pagination for the current controller.<br/>
	*
	* &lt;g:paginate total="${Account.count()}" /&gt;<br/>
	*
	* @emptyTag
	*
	* @attr total REQUIRED The total number of results to paginate
	* @attr action the name of the action to use in the link, if not specified the default action will be linked
	* @attr controller the name of the controller to use in the link, if not specified the current controller will be linked
	* @attr id The id to use in the link
	* @attr params A map containing request parameters
	* @attr prev The text to display for the previous link (defaults to "Previous" as defined by default.paginate.prev property in I18n messages.properties)
	* @attr next The text to display for the next link (defaults to "Next" as defined by default.paginate.next property in I18n messages.properties)
	* @attr max The number of records displayed per page (defaults to 10). Used ONLY if params.max is empty
	* @attr maxsteps The number of steps displayed for pagination (defaults to 10). Used ONLY if params.maxsteps is empty
	* @attr offset Used only if params.offset is empty
	* @attr fragment The link fragment (often called anchor tag) to use
	*/
   Closure paginate = { attrs ->
	   def writer = out
	   def total = attrs.int('total') ?: 0
	   def action = "listar"
	   def offset = params.int('offset') ?: 0
	   def max = params.int('max')
	   def maxsteps = 10
	   if (!offset) offset = 0
	   if (!max) max = 10
	   def linkParams = [:]
	   linkParams.offset = offset - max
	   linkParams.max = max
	   def linkTagAttrs = [action: action]
	   if (attrs.controller) {
		   linkTagAttrs.controller = attrs.controller
	   }
	   linkTagAttrs.params = linkParams
	   // determine paging variables
	   def steps = maxsteps > 0
	   int currentstep = (offset / max) + 1
	   int firststep = 1
	   int laststep = Math.round(Math.ceil(total / max))
	   if (laststep > 1){
		   writer << "<div class='paginacao'>"
	   }
	   // display previous link when not on firststep
	   if (currentstep > firststep) {
		   linkTagAttrs.class = 'prevLink btn_no_text btn ui-state-default ui-corner-all prev'
		   linkParams.offset = offset - max
		   writer << link(linkTagAttrs.clone()) {
			   ("<span class='ui-icon ui-icon-circle-arrow-w'></span>")
		   }
	   }
	   // display steps when steps are enabled and laststep is not firststep
	   if (steps && laststep > firststep) {
		   linkTagAttrs.class = 'step'

		   // display paginate steps
		   (firststep..laststep).each { i ->
			   if (currentstep == i) {
				   writer << "<span class=\"currentStep\">${i}</span>"
			   }
			   else {
				   linkParams.offset = (i - 1) * max
				   writer << link(linkTagAttrs.clone()) {i.toString()}
			   }
		   }
	   }
	   // display next link when not on laststep
	   if (currentstep < laststep) {
		   linkTagAttrs.class = 'nextLink btn_no_text btn ui-state-default ui-corner-all next'
		   linkParams.offset = offset + max
		   writer << link(linkTagAttrs.clone()) {
			   ("<span class='ui-icon ui-icon-circle-arrow-e'></span>")
		   }
	   }
	   if (laststep > 1){
		   writer << "</div>"
	   }
   }
}
