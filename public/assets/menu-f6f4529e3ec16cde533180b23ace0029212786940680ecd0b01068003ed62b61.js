$(function(){var e=!1;$(window).on("resize",function(){var n=$(window).width(),a=$("#top-menu"),o=$("#side-menu");if(768>n){if(a.hasClass("active")){a.removeClass("active"),o.addClass("active");var s=$("#top-menu .movable.dropdown");if(s.detach(),s.removeClass("dropdown"),s.addClass("nav-header"),s.find(".dropdown-toggle").removeClass("dropdown-toggle").addClass("link"),s.find(".dropdown-menu").removeClass("dropdown-menu").addClass("submenu"),s.prependTo(o.find(".accordion")),$("#top-menu #qform").detach().removeClass("navbar-form").prependTo(o),!e){var d=function(e,n){this.el=e||{},this.multiple=n||!1;var a=this.el.find(".movable .link");a.on("click",{el:this.el,multiple:this.multiple},this.dropdown)};d.prototype.dropdown=function(e){var n=e.data.el;$this=$(this),$next=$this.next(),$next.slideToggle(),$this.parent().toggleClass("open"),e.data.multiple||n.find(".movable .submenu").not($next).slideUp().parent().removeClass("open")};new d($("ul.accordion"),!1);e=!0}}}else if(o.hasClass("active")){o.removeClass("active"),a.addClass("active");var s=$("#side-menu .movable.nav-header");s.detach(),s.removeClass("nav-header"),s.addClass("dropdown"),s.find(".link").removeClass("link").addClass("dropdown-toggle"),s.find(".submenu").removeClass("submenu").addClass("dropdown-menu"),$("#side-menu #qform").detach().addClass("navbar-form").appendTo(a.find(".nav")),s.appendTo(a.find(".nav"))}});var n=$(".side-menu-link"),a=$(".wrap");n.click(function(){return n.toggleClass("active"),a.toggleClass("active"),!1});var o=function(e,n){this.el=e||{},this.multiple=n||!1;var a=this.el.find(".link");a.on("click",{el:this.el,multiple:this.multiple},this.dropdown)};o.prototype.dropdown=function(e){var n=e.data.el;$this=$(this),$next=$this.next(),$next.slideToggle(),$this.parent().toggleClass("open"),e.data.multiple||n.find(".submenu").not($next).slideUp().parent().removeClass("open")};new o($("ul.accordion"),!1)});