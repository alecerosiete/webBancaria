/* Copyright (C) 2007 - 2010 YOOtheme GmbH, YOOtheme License (http://www.yootheme.com/license) */

Zoo.BrowseItems=new Class({initialize:function(c){this.setOptions({url:"index.php"},c);this.timer=null;this.delay=1500;$$("#items-default td.priority").each(function(b){var a=b.getElement("input.value");a.addEvent("change",this.save.bind(this));b.getElement("span.plus").addEvent("click",function(){a.setProperty("value",a.getProperty("value").toInt()+1).fireEvent("change")});b.getElement("span.minus").addEvent("click",function(){a.setProperty("value",a.getProperty("value").toInt()-1).fireEvent("change")})}.bind(this))},
save:function(){$clear(this.timer);this.timer=function(){var c=new Hash,b=$("items-default").getElement("table.list");$("items-default").getElementsBySelector("input[name^=priority], input[type=hidden]").each(function(a){var d=a.name,e=a.getValue();e===false||!d||a.disabled||c.set(d,e)});(new Ajax(this.options.url,{method:"post",data:c.merge({task:"savepriority",format:"raw"}).obj,onRequest:function(){b.addClass("loader")},onComplete:function(a){b.removeClass("loader");Message.show(a,true)}})).request()}.bind(this).delay(this.delay)}});
Zoo.BrowseItems.implement(new Options);Zoo.EditItem=new Class({initialize:function(){var c=this;(new Array("apply","save")).each(function(b){$("toolbar-"+b).getElement("a").removeProperty("onclick").addEvent("click",function(){c.submit(b)})})},submit:function(c){$("name-edit").getElement('input[name="name"]').value==""?$("name-edit").getElement("span.message-name").setStyle("display","inline"):submitbutton(c)}}); 
