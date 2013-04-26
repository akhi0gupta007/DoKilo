package com.codebee.products

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import com.codebee.FileUploaderService
import com.codebee.TokenGeneratorService
import org.codehaus.groovy.grails.commons.ConfigurationHolder


class XlsUploaderController {
	def FileUploaderService
	def TokenGeneratorService
	def XlsFetchService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    ConfigObject holder = ConfigurationHolder.getConfig();
    def real = holder.getProperty("doc")
    def realPath = holder.getProperty("docPath")
	def add(){
		def user=session.user.attach()
		def vens = user.vendor
		def types = user.proType
		def counter = []
		boolean val = false
		def data = XlsFetchService.fetchMe("/tmp/product.xls")
		for(x in data){
			
			def title = x[0]
			def desc = x[1]
			def sale = x[2]
			def pro_id = x[3]
			def weight = x[4]
			def type = x[5]
			def tax = x[6]
			def ship = x[7]
			def vendor = x[8]
			boolean updateve = false
			boolean updatetype = false
			
				for(z in vens){
						if(z.ven_name.toString().equalsIgnoreCase(vendor.toString())){
							vendor = z
							updateve = true
						break;
						}
					} 
				
				if(!updateve){
					vendor = new Vendor(ven_name:vendor)
					vendor.save()
					user.addToVendor(vendor)
					}
				
				for(z in types){
					if(z.type.toString().substring(0,z.type.toString().length()-1).equalsIgnoreCase(type.toString().substring(0,type.toString().length()-1))){
						type = z
						updatetype = true
					break;
					}
				}
			
				
				if(!updatetype){
					type= new ProType(type:type)
					type.save()
					user.addToProType(type)
					}
				
			def product = new Product(sel_price:sale,title:title,description:desc,pro_id:pro_id,weight:weight,tax:tax,ship_addr:ship)
			product.type = type
			product.vendor = vendor
				if(product.validate()){
				val = true
				product.save()
				user.addToProduct(product)
				}
			}
		render "${val}"
		}
	
	def docs(){
		def user=session.user.attach()
		def data = user.xlsUploader
	
		[docs:data]
		}
	
	def handle(){
		def xy="not logged in"
		def status
		def myl
		if(session["user"]){
			def user=session.user.attach()
			def name = user.userId
			def today = TokenGeneratorService.getToken()
			def hio
			if(request instanceof MultipartHttpServletRequest){
                def fileName = real+"doc_${name}_${today}.xls"
				status = FileUploaderService.upload(fileName,"xls",request)
				if(status){
					def way = realPath + "doc_${name}_${today}.xls"
					def web = "doc_${name}_${today}.xls"
					def xls = new XlsUploader(path:way,webpath:web,title:"doc_${name}_${today}.xls")
					xls.save()
					user.addToXlsUploader(xls)
					user.save()
					myl=user.xlsUploader.path
					hio=XlsFetchService.fetchMe(way)
					
					
					/*
					 *  DB Update Code
					 */
					def vens = user.vendor
					def types = user.proType
					def counter = []
					boolean val = false
					def data = XlsFetchService.fetchMe(way)
					for(x in data){
						
						def title = x[0]
						def desc = x[1]
						def sale = x[2]
						def pro_id = x[3]
						def weight = x[4]
						def type = x[5]
						def tax = x[6]
						def ship = x[7]
						def vendor = x[8]
						boolean updateve = false
						boolean updatetype = false
						
							for(z in vens){
									if(z.ven_name.toString().equalsIgnoreCase(vendor.toString())){
										vendor = z
										updateve = true
									break;
									}
								}
							
							if(!updateve){
								vendor = new Vendor(ven_name:vendor)
								vendor.save()
								user.addToVendor(vendor)
								}
							
							for(z in types){
								if(z.type.toString().substring(0,z.type.toString().length()-1).equalsIgnoreCase(type.toString().substring(0,type.toString().length()-1))){
									type = z
									updatetype = true
								break;
								}
							}
						
							
							if(!updatetype){
								type= new ProType(type:type)
								type.save()
								user.addToProType(type)
								}
							
						def product = new Product(sel_price:sale,title:title,description:desc,pro_id:pro_id,weight:weight,tax:tax,ship_addr:ship,user: user)
						product.type = type
						product.vendor = vendor
							if(product.validate()){
							val = true
							product.save()
							user.addToProduct(product)
							}
						}
					
					
					}
			
		}
			redirect (action:"docs")
		}else{
			
			render xy
		}
		
		
		}
	
	def showing(){
		
		
		}
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [xlsUploaderInstanceList: XlsUploader.list(params), xlsUploaderInstanceTotal: XlsUploader.count()]
    }

    def create() {
        [xlsUploaderInstance: new XlsUploader(params)]
    }

    def save() {
        def xlsUploaderInstance = new XlsUploader(params)
        if (!xlsUploaderInstance.save(flush: true)) {
            render(view: "create", model: [xlsUploaderInstance: xlsUploaderInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'xlsUploader.label', default: 'XlsUploader'), xlsUploaderInstance.id])
        redirect(action: "show", id: xlsUploaderInstance.id)
    }

    def show() {
        def xlsUploaderInstance = XlsUploader.get(params.id)
        if (!xlsUploaderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'xlsUploader.label', default: 'XlsUploader'), params.id])
            redirect(action: "list")
            return
        }

        [xlsUploaderInstance: xlsUploaderInstance]
    }

    def edit() {
        def xlsUploaderInstance = XlsUploader.get(params.id)
        if (!xlsUploaderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'xlsUploader.label', default: 'XlsUploader'), params.id])
            redirect(action: "list")
            return
        }

        [xlsUploaderInstance: xlsUploaderInstance]
    }

    def update() {
        def xlsUploaderInstance = XlsUploader.get(params.id)
        if (!xlsUploaderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'xlsUploader.label', default: 'XlsUploader'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (xlsUploaderInstance.version > version) {
                xlsUploaderInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'xlsUploader.label', default: 'XlsUploader')] as Object[],
                          "Another user has updated this XlsUploader while you were editing")
                render(view: "edit", model: [xlsUploaderInstance: xlsUploaderInstance])
                return
            }
        }

        xlsUploaderInstance.properties = params

        if (!xlsUploaderInstance.save(flush: true)) {
            render(view: "edit", model: [xlsUploaderInstance: xlsUploaderInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'xlsUploader.label', default: 'XlsUploader'), xlsUploaderInstance.id])
        redirect(action: "show", id: xlsUploaderInstance.id)
    }

    def delete() {
        def xlsUploaderInstance = XlsUploader.get(params.id)
        if (!xlsUploaderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'xlsUploader.label', default: 'XlsUploader'), params.id])
            redirect(action: "list")
            return
        }

        try {
            xlsUploaderInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'xlsUploader.label', default: 'XlsUploader'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'xlsUploader.label', default: 'XlsUploader'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
