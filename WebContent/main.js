$('.cardview.managerId').on('press', function (e) {
	if (confirm('確定刪除嗎?')) {
  		document.getElementById('Manager').submit();
    	$(this).hide();
	} else {
		location.reload();
	}
});

$('.cardview.accountId').on('press', function (e) {
	if (confirm('確定刪除嗎?')) {
		document.getElementById('Account').submit();
    	$(this).hide();
    } else {
		location.reload();
	}
});
$('select.TravelPri').change(function () {
        $('div.travelshow').hide();
        $('div.travelshow').eq(0).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(0).show();

    if (document.getElementById("TravelPri").selectedIndex === 1 && 
        document.getElementById("TravelSub").selectedIndex === 1) {
        $('div.travelshow').hide();
        $('div.travelshow').eq(1).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(1).show();
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && 
        document.getElementById("TravelSub").selectedIndex === 2) {
        $('div.travelshow').hide();
        $('div.travelshow').eq(3).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(3).show();
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && 
        document.getElementById("TravelSub").selectedIndex === 1) {
        $('div.travelshow').hide();
        $('div.travelshow').eq(5).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(5).show();
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && 
        document.getElementById("TravelSub").selectedIndex === 2) {
        $('div.travelshow').hide();
        $('div.travelshow').eq(7).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(7).show();
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && 
        document.getElementById("TravelSub").selectedIndex === 1) {
        $('div.travelshow').hide();
        $('div.travelshow').eq(9).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(9).show();
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && 
        document.getElementById("TravelSub").selectedIndex === 2) {
        $('div.travelshow').hide();
        $('div.travelshow').eq(11).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(11).show();
    }
}).change();

$('select.TravelSub').change(function () {
    if (document.getElementById("TravelPri").selectedIndex === 1 && 
        document.getElementById("TravelSub").selectedIndex === 1) {
        $('div.travelshow').hide();
        $('div.travelshow').eq(1).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(1).show();
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && 
        document.getElementById("TravelSub").selectedIndex === 2) {
        $('div.travelshow').hide();
        $('div.travelshow').eq(3).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(3).show();
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && 
        document.getElementById("TravelSub").selectedIndex === 1) {
        $('div.travelshow').hide();
        $('div.travelshow').eq(5).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(5).show();
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && 
        document.getElementById("TravelSub").selectedIndex === 2) {
        $('div.travelshow').hide();
        $('div.travelshow').eq(7).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(7).show();
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && 
        document.getElementById("TravelSub").selectedIndex === 1) {
        $('div.travelshow').hide();
        $('div.travelshow').eq(9).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(9).show();
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && 
        document.getElementById("TravelSub").selectedIndex === 2) {
        $('div.travelshow').hide();
        $('div.travelshow').eq(11).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(11).show();
    }
}).change();

document.getElementById('Hate').onclick = function() {
    if (document.getElementById("TravelPri").selectedIndex === 1 && 
        document.getElementById("TravelSub").selectedIndex === 1) {
        if ($('div.travelshow').eq(2).is(":visible")){
            $('div.travelshow').hide();
            $('div.travelshow').eq(1).show();
            $('div.navbar a.upperR').hide();
            $('div.navbar a.upperR').eq(1).show();
        }else{
            $('div.travelshow').hide();
            $('div.travelshow').eq(2).show();
            $('div.navbar a.upperR').hide();
            $('div.navbar a.upperR').eq(2).show();
        }
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && 
        document.getElementById("TravelSub").selectedIndex === 2) {
        if ($('div.travelshow').eq(4).is(":visible")){
            $('div.travelshow').hide();
            $('div.travelshow').eq(3).show();
            $('div.navbar a.upperR').hide();
            $('div.navbar a.upperR').eq(3).show();
        }else{
            $('div.travelshow').hide();
            $('div.travelshow').eq(4).show();
            $('div.navbar a.upperR').hide();
            $('div.navbar a.upperR').eq(4).show();
        }
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && 
        document.getElementById("TravelSub").selectedIndex === 1) {
        if ($('div.travelshow').eq(6).is(":visible")){
            $('div.travelshow').hide();
            $('div.travelshow').eq(5).show();
            $('div.navbar a.upperR').hide();
            $('div.navbar a.upperR').eq(5).show();
        }else{
            $('div.travelshow').hide();
            $('div.travelshow').eq(6).show();
            $('div.navbar a.upperR').hide();
            $('div.navbar a.upperR').eq(6).show();
        }
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && 
        document.getElementById("TravelSub").selectedIndex === 2) {
        if ($('div.travelshow').eq(8).is(":visible")){
            $('div.travelshow').hide();
            $('div.travelshow').eq(7).show();
            $('div.navbar a.upperR').hide();
            $('div.navbar a.upperR').eq(7).show();
        }else{
            $('div.travelshow').hide();
            $('div.travelshow').eq(8).show();
            $('div.navbar a.upperR').hide();
            $('div.navbar a.upperR').eq(8).show();
        }
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && 
        document.getElementById("TravelSub").selectedIndex === 1) {
        if ($('div.travelshow').eq(10).is(":visible")){
            $('div.travelshow').hide();
            $('div.travelshow').eq(9).show();
            $('div.navbar a.upperR').hide();
            $('div.navbar a.upperR').eq(9).show();
        }else{
            $('div.travelshow').hide();
            $('div.travelshow').eq(10).show();
            $('div.navbar a.upperR').hide();
            $('div.navbar a.upperR').eq(10).show();
        }
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && 
        document.getElementById("TravelSub").selectedIndex === 2) {
        if ($('div.travelshow').eq(12).is(":visible")){
            $('div.travelshow').hide();
            $('div.travelshow').eq(11).show();
            $('div.navbar a.upperR').hide();
            $('div.navbar a.upperR').eq(11).show();
        }else{
            $('div.travelshow').hide();
            $('div.travelshow').eq(12).show();
            $('div.navbar a.upperR').hide();
            $('div.navbar a.upperR').eq(12).show();
        }
    }
}