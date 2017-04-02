//= require_tree .

bee.filter('googlemap', {
   create: function(element, options){
       return new Googlemap(element, options);
   }
});

bee.filter('converter', {
    create:  function(element, options){
        return new Converter(element, options)
    }
});

jQuery(document).ready(function($){
    bee.init(document);
});