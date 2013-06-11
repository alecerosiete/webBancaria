/* Copyright (C) 2007 - 2010 YOOtheme GmbH, YOOtheme License (http://www.yootheme.com/license) */

Zoo.EditElements=new Class({initialize:function(c){this.setOptions({url:"index.php?option=com_zoo&controller=manager",msgNoElements:"No elements defined for this type",msgDeletelog:"Are you sure you want to delete the element?"},c);this.count=0;this.sort=null;this.noElements();this.attachEvents()},attachEvents:function(){var c=this;this.attachSort();$("element-list").getElements("div.edit-event").each(function(b){b.addEvent("click",function(){c.editElement(b)})});$("element-list").getElements("div.delete-event").each(function(b){b.addEvent("click",
function(){c.deleteElement(b)})});$("add-element").getElements("ul.elements li").each(function(b){b.addEvent("click",function(){c.addElement(b.getProperty("class"),c.count++)})})},attachSort:function(){var c=this;this.sort=new Sortables($("element-list"),{handles:$("element-list").getElements("div.sort-event"),onDragStart:function(b,a){c.preserveState();var d=b.getCoordinates();b.setStyle("opacity",0.5);b.addClass("dragging");(new Element("ul",{"class":"element-list"})).adopt(this.trash.getChildren()).inject(this.trash);
a.addClass("hideconfig");a.setStyles({"background-color":"#ffffff",width:d.width-22,opacity:1})},onDragComplete:function(b){c.recoverState();b.setStyle("opacity",1);b.removeClass("dragging");this.trash.empty().remove();c.orderElements()}})},addElement:function(c,b){var a=this,d=$("element-list"),e=new Element("li",{"class":"element"}),f=e.effects({duration:200,transition:Fx.Transitions.linear});(new Ajax(this.options.url+"&format=raw&task=addelement",{method:"post",data:"element="+c+"&count="+b,onRequest:function(){e.addClass("loading");
e.injectTop(d)},onComplete:function(h){e.removeClass("loading");e.setHTML(h);a.noElements();a.orderElements();a.sort.detach();a.attachSort();e.getElements("div.edit-event").each(function(g){g.addEvent("click",function(){a.editElement(g)})});e.getElements("div.delete-event").each(function(g){g.addEvent("click",function(){a.deleteElement(g)})});new Tips(e.getElements(".hasTip"),{maxTitleChars:50,fixed:false});e.getElements("script").each(function(g){eval(g.innerHTML)});h=e.getCoordinates();e.setStyles({height:0,
opacity:0});f.start({height:h.height-22,opacity:1}).chain(function(){e.setStyles({height:"auto",opacity:1});a.highlight(e)})}})).request()},editElement:function(c){c.getParent().toggleClass("hideconfig")},deleteElement:function(c){if(confirm(this.options.msgDeletelog)){var b=this,a=c.getParent();a.effects({duration:200,transition:Fx.Transitions.linear}).start({height:0,opacity:0}).chain(function(){a.remove();b.noElements();b.orderElements()})}},orderElements:function(){$("element-list").getElements("input[name*=ordering]").each(function(c,
b){c.setProperty("value",b)})},noElements:function(){var c=$("element-list"),b=c.getElements("li"),a=c.getElements("li.no-elements");if(b.length==0)(new Element("li",{"class":"no-elements"})).setHTML(this.options.msgNoElements).injectTop(c);else b.length>1&&a.length==1&&a.each(function(d){d.remove()})},preserveState:function(){$$("#element-list li.element").each(function(c){if(!c.hasClass("hideconfig")){c.addClass("hideconfig");c._showconfig=true}})},recoverState:function(){$$("#element-list li.element").each(function(c){if(c._showconfig){c.removeClass("hideconfig");
c._showconfig=false}})},highlight:function(c){var b=c.effects({duration:100,transition:Fx.Transitions.linear});c.setStyle("background-color","#ffffff");b.start({"background-color":"#ffffaa"}).chain(function(){this.setOptions({duration:700});this.start({"background-color":"#ffffff"})}).chain(function(){c.removeProperty("style")})}});Zoo.EditElements.implement(new Options);
Zoo.AssignElements=new Class({initialize:function(){var c=this,b=new SortableList({handle:"div.sort-event",opacity:0.5,onAddItem:function(a){a.getElement("div.edit-event").addEvent("click",function(){a.toggleClass("hideconfig")});a.getElement("div.delete-event").addEvent("click",function(){a.effects({duration:200,transition:Fx.Transitions.linear}).start({height:0,opacity:0}).chain(function(){var d=a.getParent();d.getChildren().length<=1&&d.addClass("empty-list");a.remove()})})},onStart:function(a,
d){a.addClass("dragging");d.setStyle("z-index",10)},onClone:function(a){a.getElements("input").each(function(d){d.setProperty("name","")})},onDragStart:function(a){if(b.list.getProperty("role")=="unassigned"){b.element=a.clone();b.element.getElementsBySelector("input[name^=elements]").each(function(d){d.setProperty("name",d.getProperty("name").replace(/(elements)\[[a-z0-9_-]+\]/i,"$1[dragging]"))});b.addItems([b.element])}},onSort:function(a,d){if(a.getParent().getProperty("role")=="unassigned"){a.setStyle("display",
"none");d.setStyle("opacity",0.5)}else{a.setStyle("display","block");d.setStyle("opacity",1)}b.lists.each(function(e){var f=e.getChildren();if(f.contains(d)&&f.length==1)e.addClass("empty-list");else f.length==0?e.addClass("empty-list"):e.removeClass("empty-list")})},onComplete:function(a){var d=a.getParent();d&&d.getProperty("role")=="unassigned"?a.remove():a.removeClass("dragging");c.sanatizeList(b);b.clone=null;b.element=null}});$$("ul.element-list").each(function(a){b.addList(a);a.getChildren().length>
0?a.removeClass("empty-list"):a.addClass("empty-list")});this.sanatizeList(b)},sanatizeList:function(c){var b="";c.lists.each(function(a){if(a.getProperty("role")!="unassigned"){b="positions["+a.getProperty("role")+"]";a.getChildren().each(function(d,e){$(d).getElementsBySelector("input[name^=elements], select[name^=elements], input[name^=positions], select[name^=positions]").each(function(f){f.setProperty("name","tmp"+f.getProperty("name").replace(/(elements\[[a-z0-9_-]+\])|(positions\[[a-z0-9_-]+\]\[[0-9]+\])/i,
b+"["+e+"]"))})})}});$("assign-elements").getElementsBySelector("input[name^=tmp], select[name^=tmp]").each(function(a){a.setProperty("name",a.getProperty("name").replace(/^tmp/,""))})}});
Zoo.EditType=new Class({initialize:function(){var c=this;(new Array("apply","save")).each(function(b){$("toolbar-"+b).getElement("a").removeProperty("onclick").addEvent("click",function(){c.submit(b)})})},submit:function(c){$("name-edit").getElement('input[name="name"]').value==""?$("name-edit").getElement("span.message-name").setStyle("display","inline"):submitbutton(c+"type")}}); 