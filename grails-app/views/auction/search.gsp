<%@ page import="sheepers.Auction" %>
<!DOCTYPE html>
<html dir='rtl'>
<head>
    <title>search moving requests</title>
    <meta name="layout" content="main">
    <r:require modules="application, forms"/>
    <r:layoutResources/>

</head>
<body>
<div class="container-fluid">
    <div class="row-fluid" dir="rtl">
        <section class="search-pane span10 offset1" >
            <div class="searchBar">
                <g:form controller="auction" class="form-search">
                    <fieldset>
                        <legend class="searchLegend">חיפוש הובלות</legend>
                        <span class="span2">
                            <g:submitToRemote name="search" class="btn signup-btn" value="מצא" action="searchp" update="searchRes"/>
                        </span>

                        %{--<label>עיר יעד</label>--}%
                     <ul class="unstyled span3">
                        <li><input  id="toaddSel" readonly="readOnly" name="toArea"  class="search-input "  placeholder="לאיפה מגיעים"  /></li>
                                    <div id="ToAdrSel"  class="addrSearch span3 hide">
                                          <legend class="pull-right"><h5> הכנס כתובת </h5></legend>
                                         <span class="span3 pull-right">
                                          <input  id="toAreaSel" name="toAreaSel" class="input-medium" placeholder="לאיפה מגיעים"/>
                                          </span>
                                            <span class="span3 pull-leftt">
                                         <button id="ToAdrSub" class="btn signup-btn pull-left">עדכן</button>
                                        </span>
                                    </div>
                        <li><g:checkBox name="toCloseArea" />
                        <label class="label label-search">והסביבה הקרובה </label></li>
                    </ul>
                        %{--<label>עיר מוצא:</label>--}%
                        <ul class="unstyled span3">
                            <li><input  id="fromaddSel" readonly="readOnly" name="fromArea"  class="search-input"  placeholder = "מאיפה יוצאים"/></li>

                            <div id="FromAdrSel"  class="addrSearch span3 hide">
                                <legend class="pull-right"><h5> הכנס כתובת </h5></legend>
                                <span class="span3 pull-right">
                                    <input  id="fromAreaSel" name="fromAreaSel" class="input-medium" placeholder="מאיפה מגיעים"/>
                                </span>
                                <span class="span3 pull-leftt">
                                    <button id="FromAdrSub" class="btn signup-btn pull-left">עדכן</button>
                                </span>
                            </div>
                            <li><g:checkBox name="fromCloseArea" />
                                <label class="label label-search">והסביבה הקרובה </label></li>
                        </ul>

                        %{--<label>תאריך סיום:</label>--}%
                        <span class="span3">
                        <input id="searchDate" readonly="readOnly" name="searchDate" class="search-input" placeholder="בחר תאריך אחרון להובלה"/>
                    </span>


                        %{--<g:set var="frmAdrlat" scope="flash" value="1112"/>--}%
                        <g:hiddenField name="fromAdrLat" />
                        <g:hiddenField name="fromAdrLng" />
                        <g:hiddenField name="toAdrLat" />
                        <g:hiddenField name="toAdrLng"/>
                    </fieldset>
                </g:form>
            </div>
        </section>
    </div>
    <div class="row-fluid" dir="rtl">
        <section id="searchRes" class="span8 offset2"></section>
    </div>

</div>


<r:script>
$("#toaddSel").css("cursor","default");
$("#fromaddSel").css("cursor","default");
$("#searchDate").css("cursor","default");

    //    datepicker
    $('#searchDate').datepicker().on('changeDate',function(){
        $('#searchDate').datepicker('hide');
    });


    ////// autocomplete input
function gooInitTo(){

    var options = {
        types: ['(cities)'],
        componentRestrictions: {country: 'il'}
    };

    var toInput = document.getElementById("toAreaSel");
    var toAutocomplete = new google.maps.places.Autocomplete(toInput, options);




    google.maps.event.addListener(toAutocomplete, 'place_changed', function() {
        var place = toAutocomplete.getPlace();
        if (!place.geometry) {
            // Inform the user that the place was not found and return.
            toAutocomplete.className = 'notfound';
            return;
        }
        $('#toAdrLat').val(place.geometry.location.lat());
        $('#toAdrLng').val(place.geometry.location.lng());
    });
    }

function gooInitFrom(){

    var options = {
        types: ['(cities)'],
        componentRestrictions: {country: 'il'}
    };

    var fromInput = document.getElementById("fromAreaSel");
    var fromAutocomplete = new google.maps.places.Autocomplete(fromInput,options);



    google.maps.event.addListener(fromAutocomplete, 'place_changed', function() {
        var place = fromAutocomplete.getPlace();
        if (!place.geometry) {
            // Inform the user that the place was not found and return.
            fromAutocomplete.className = 'notfound';
            return;
        }
        $('#fromAdrLat').val(place.geometry.location.lat());
        $('#fromAdrLng').val(place.geometry.location.lng());
    });

    }

//    button expansion
    function showAdditionalInfo(aucId){
//     if ($("#auc_addtional_info_"+ aucId).hasClass("hide")) {
    if ($("#auc_addtional_info_"+aucId).is(":hidden")){
       $(".auc_addtional_info_"+ aucId).slideToggle("slow");
       $("#btn_"+ aucId).html('<i class="icon-chevron-sign-right"></i>  הצג פחות').removeClass('btn-primary').addClass('btn-warning');
       if ($("#CarouselIn_" + aucId).children('div').length == 0 ){
        loadImages(aucId)
       }
     }
     else {
       $("#btn_"+ aucId).html('<i class="icon-chevron-sign-left"></i>  הצג עוד').removeClass('btn-warning').addClass('btn-primary');
      $(".auc_addtional_info_"+ aucId).slideToggle("slow");

     }
    }

    function loadImages (aucId) {
     %{--<g:remoteFunction params="[aucId:aucId]"  action="getImages" controller="image" update="[success:('CarouselIn_'+ aucId)]"  onComplete="showImg(${aucId})"/>--}%
    var url = '/sheepers/image/getImages/' + aucId;
    var carouselIn_num = '#CarouselIn_' + aucId;
    $.ajax({
        type:'POST',
        url:url,
        success:function(data,textStatus){jQuery(carouselIn_num).html(data);},
        error:function(XMLHttpRequest,textStatus,errorThrown){},
        complete:function(XMLHttpRequest,textStatus){showImg(aucId)}
    });
}

    function showImg(aucId){
    $(".auc_addtional_info_"+ aucId).removeClass("hide");
    if ($("#CarouselIn_" + aucId).children('div').length > 0 ){
         $("#myCarousel_" + aucId ).removeClass("hide");
         $("#CarouselIn_" + aucId).children('div').last().addClass('active');
        }
    }
//    End of button expansion

/* Submitting bid*/
    function submitBid(aucId){
    var bid = $("#bid_"+ aucId).val();
     $.ajax({
        type:'POST',
//        data:jQuery(this).parents('form:first').serialize(),
        url:'/sheepers/bid/save?auction.id='+aucId +'&amount='+bid,
        success:function(data,textStatus){$("#Pbid_"+aucId).append(data)},
        error:function(XMLHttpRequest,textStatus,errorThrown){}

     });
    }
    // Address selectors
$("#toaddSel").on('click',function(){
    $(".pac-container").remove();
    $("#FromAdrSel").addClass('hide');
    $("#ToAdrSel").removeClass('hide');
    gooInitTo();
});
$("#fromaddSel").on('click',function(){
    $(".pac-container").remove();
    $("#ToAdrSel").addClass('hide');
    $("#FromAdrSel").removeClass('hide');
    gooInitFrom();
});


$("#ToAdrSub").on('click',function(e){
    $("#ToAdrSel").addClass('hide');
    $(".pac-container").remove();
    $("#toaddSel").val($("#toAreaSel").val());
    e.preventDefault();
});

    $("#FromAdrSub").on('click',function(e){
    $("#FromAdrSel").addClass('hide');
    $(".pac-container").remove();
    $("#fromaddSel").val($("#fromAreaSel").val());
    e.preventDefault();
});


</r:script>
<script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&language=he&region=il"></script>
<r:layoutResources/>
</body>
</html>