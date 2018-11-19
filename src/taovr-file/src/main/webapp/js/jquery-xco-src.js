	(function($){
		$.extend({
			doXcoRequest: function(options){
				options = options || {};
				try{
					var _strServletURL = options.url || '';
					var _xcoRequestXml = options.data.toXML();
					_url = encodeURI(_strServletURL);
					jQuery.ajax({
						url : _url,
						async: options.async==undefined?true:options.async,
						contentType: options.contentType || 'application/xco;charset=utf-8',
						type : 'POST',
						ifModified: options.ifModified || false,
						cache: options.cache==undefined?true:options.cache,
						dataType : options.dataType || 'xml',
						data:encodeURIComponent(_xcoRequestXml),//'$$XCORequest$$=' + 
						success : function(response){
							var _xcoResponse = new XCO();
							try {
								_xcoResponse.fromXML0(response);
								//console.log(options);
								if(options.success){
									if(options.extra==undefined){
										options.success(_xcoResponse);
									}else{
										//if(checkError(response)){return;}
										options.success(_xcoResponse,options.extra);
									}
								}
							} catch (e) {
								/*
								console.log(e);
								options.exception = e.toString();
								console.error(options.exception);*/
								alert(e.toString());
							}
							//options.xcoResponse = _xcoResponse;
						}
					});							
				} catch(e){
				}
				return options;
			}
		});
	})(jQuery);

	
