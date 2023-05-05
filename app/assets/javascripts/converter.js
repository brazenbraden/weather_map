var Converter = (function($){

    /**
     * @param el
     * @constructor
     */

    return function(element, options){
        var $el = $(element),
            $currentEl = $el.find('.current'),
            $minEl = $el.find('.min'),
            $maxEl = $el.find('.max'),
            $button = $el.find('.btn'),
            current = $currentEl.html(),
            min = $minEl.html(),
            max = $maxEl.html(),
            currentUnit = options.default_unit,
            converters = {
                C: function (temp) {
                    return (temp - 273.15).toFixed(2);
                },
                F: function (temp) {
                    return ((temp * (9 / 5)) - 459.67).toFixed(2);
                }
            };

        function convert(type){
            var converter = converters[type];
            $currentEl.html(converter(current) + ' ' + type);
            $minEl.html(converter(min) + ' ' + type);
            $maxEl.html(converter(max) + ' ' + type);
            $button.html(options.button_label[type]);
            currentUnit = type === 'C' ? 'F' : 'C';
        }

        convert(currentUnit);

        $button.on('click', function(){
            convert(currentUnit);
        });
    };

})($);


