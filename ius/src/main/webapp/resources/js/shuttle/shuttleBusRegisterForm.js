$(document).ready(function(){            
   
        var wrapper = $("#bus_list");
        var add_button = $(".add_bus_button");

        $(add_button).click(function(e) {
            e.preventDefault();
                $(wrapper).append("<tr class='input_bus_list'>"
                        +"<td><select class='hour' name='shuttle_hour[]'>"
                        +"<c:forEach var='h' begin='0' end='24'><c:choose><c:when test='${h < 10 }'><option value='0${h}'>0${h}</option>"
					    +"</c:when><c:otherwise><option value='${h}'>${h}</option></c:otherwise></c:choose></c:forEach></select> 시"
                        +"<select class='minute' name='shuttle_minute[]'><c:forEach var='m' begin='0' end='59'><c:choose><c:when test='${m < 10}'><option value='0${m}'>0${m}</option>"
                        +"</c:when><c:otherwise><option value='${m}'>${m}</option></c:otherwise></c:choose></c:forEach></select> 분</td>"
                        +"<td><input type='text' name='bus_stop[]' required='required'></td>"
                        +"<td class='del_button'><input type='button' value='삭제'></td><tr>");
        });
        
        $(wrapper).on("click", ".del_button", function(e) {
            e.preventDefault();
            $(this).parent('.input_bus_list').remove();
        });   
             
});