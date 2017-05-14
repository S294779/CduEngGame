$(function () {
    var f_limit = 1;
    var f_limit_min = 1;
    var old_f_count = 1;
    var f_cnt = 0;
    var initialized = undefined;
    $.fn.addField = function (options) {
        f_limit = options.maximum_limit;
        f_limit_min = options.minimum_limit;
        old_f_count = options.oldcount;
        if (initialized == undefined) {
            f_cnt = old_f_count - 1;
            initialized = true;
        }

        $('#dyna-field-container .add-btn').unbind().on('click', function (e) {
            if (f_limit > $().fieldCount()) {
                f_cnt++;
                
                var cloned = $('#dyna-field-container .first').clone();
                cloned.removeClass('first');
                cloned.find('input').each(function (e) {
                    var oldName = $(this).attr('name').replace('0', f_cnt);
                    $(this).attr('name', oldName);
                    $(this).val('');
                });
                cloned.find('select').each(function (e) {
                    var oldName = $(this).attr('name').replace('0', f_cnt);
                    $(this).attr('name', oldName);
                    $(this).val('');
                });
                cloned.find('textarea').each(function (e) {
                    var oldName = $(this).attr('name').replace('0', f_cnt);
                    $(this).attr('name', oldName);
                    $(this).val('');
                });

                $('#dyna-field-container').append(cloned);
                $().addField({
                    maximum_limit: f_limit,
                    minimum_limit: f_limit_min,
                    oldcount: old_f_count
                });
                $().removeField();
            }
        });


    }
    $.fn.removeField = function (options) {
        $('#dyna-field-container .remove-btn').unbind().on('click', function (e) {

            if (f_limit_min < $().fieldCount()) {
                var ele = $(this).closest('.dyna-fields');
                if (!ele.hasClass('first')) {
                    $(this).closest('.dyna-fields').remove();
                }

            }
        })
    }
    $.fn.fieldCount = function (options) {
        return $('#dyna-field-container .dyna-fields').length;
    }
    $().removeField();
    
    
    
//    $('#question-field').on('blur',function(e){
//        var question = $(this).val();
//        $('.first  [name="subpart[0]"]').val(question);
//    })
    
})

