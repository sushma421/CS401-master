function validateform(){
	var fdateObj = document.getElementById("fDatepicker");
	var tdateObj = document.getElementById("tDatepicker");
	var reasonObj = document.getElementById("reason");
	
	var fDateVal = fdateObj.value;
	var tDateVal = tdateObj.value;
	var reasonVal = reasonObj.value;
	
	var fDate = new Date(fDateVal);
	var tDate = new Date(tDateVal);
	
	if((fDateVal == null) || (fDateVal == '')
				|| (tDateVal == null) || (tDateVal == '')
					|| (reasonVal == null) || (reasonVal == '')){
		alert("Please enter values into all fields. All Fields are mandatory.");
		return false;
	}else if(tDate < fDate){
		alert("Please select a future To Date.");
		return false;
	}else{
		return true;
	}
}