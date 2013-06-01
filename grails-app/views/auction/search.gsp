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
        <section class="search-pane span8 offset2" >
            <div class="well well-white">
                <g:form controller="auction" class="form-search">
                    <fieldset>
                        <legend class="">חיפוש הובלות</legend>
                        %{--<label>עיר מוצא:</label>--}%
                        <g:textField name="fromArea"  class="input-small"  placeholder = "מאיפה יוצאים"/>
                        <g:checkBox name="fromCloseArea" />
                        <label class="label label-info">והסביבה הקרובה </label>
                        %{--<label>עיר יעד</label>--}%
                        <g:textField name="toArea"  class="input-small" placeholder="לאיפה מגיעים"/>
                        <g:checkBox name="toCloseArea" />
                        <label class="label label-info">והסביבה הקרובה </label>

                        %{--<label>תאריך סיום:</label>--}%
                        <g:textField id="searchDate" name="searchDate" class="input-medium" placeholder="בחר תאריך אחרון להובלה"/>



                        <g:submitToRemote name="search" class="btn signup-btn" value="מצא לי הובלות" action="searchp" update="searchRes"/>
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
    //    datepicker
    $('#searchDate').datepicker().on('changeDate',function(){
        $('#searchDate').datepicker('hide');
    });

    ////// autocomplete input
    var options = {
        types: ['(cities)'],
        componentRestrictions: {country: 'il'}
    };

    var fromInput = document.getElementById("fromArea");
    var fromAutocomplete = new google.maps.places.Autocomplete(fromInput,options);
    var toInput = document.getElementById("toArea");
    var toAutocomplete = new google.maps.places.Autocomplete(toInput, options);



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


//    button expansion
    function showAdditionalInfo(aucId){
     if ($("#auc_addtional_info_"+ aucId).hasClass("hide")) {
       $(".auc_addtional_info_"+ aucId).slideToggle("slow");
       $("#btn_"+ aucId).html('<i class="icon-chevron-sign-right"></i>  הצג פחות').removeClass('btn-success').addClass('btn-warning');
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

</r:script>
<script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&language=he&region=il"></script>
<r:layoutResources/>
</body>
</html>