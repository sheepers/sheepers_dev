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
        <section class="search-pane span6 offset3" >
            <div class="well">
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
                        <g:set var="frmAdrlat" scope="flash" value="1112"/>
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
        <section id="searchRes" class="span6 offset3"></section>
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



    function doit () {

        alert('sss');
    }


</r:script>
<script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&language=he&region=il"></script>
<r:layoutResources/>
</body>
</html>