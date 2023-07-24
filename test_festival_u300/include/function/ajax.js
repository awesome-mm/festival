//---------------------------------------------------XML Call

var xmlDoc;  //xml DOM

function getXmlObj()
{
	var xmlhttp = null;
	
	// Mozilla/Safari
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
		xmlhttp.overrideMimeType('text/xml');
	}
	// IE
	else if (window.ActiveXObject) {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}	

	return xmlhttp;
}

 function getXMLDom(pUrl,pOption,pSearchValue)
{
	
	//xmlDoc = new ActiveXObject("Msxml2.DOMDocument"); IE6.
	//xmlDoc = new ActiveXObject("Msxml.DOMDocument"); IE5.
	//
	xmlDoc = null;
	// Mozilla/Safari
	if (window.XMLHttpRequest) {
		xmlDoc = document.implementation.createDocument("","",null);
	}
	// IE
	else if (window.ActiveXObject) {
		xmlDoc = new ActiveXObject("Microsoft.XMLDOM"); 
	}	

	xmlDoc.async=true; 

	var xmlhttp = getXmlObj();
	var templateStr = null;
	var pAsync = false;
	if (pOption == "TRUE")
	{
		pAsync = true;
	}

	if (pOption == "POST")
	{
		xmlhttp.open("POST",pUrl,pAsync);
		xmlhttp.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	}
	else
	{
		xmlhttp.open("GET",pUrl,pAsync);		
	}
	
	xmlhttp.onreadystatechange = function () {
		
		if(xmlhttp.readyState == "4")
		{
			templateStr = xmlhttp.responseXML;
			
			try
			{
				xmlDoc.load(templateStr);				
				return xmlDoc;
			}
			catch (e)
			{}
		}
	}

	try
	{
		if (pOption == "POST" )
		{	
			xmlhttp.send(pSearchValue);
		}
		else
		{
			xmlhttp.send(null);
		}
		
	}
	catch (e)
	{

		alert("에러");
	}
}

function setXMLBinding(pDom)
{
	try
	{		
		document.getElementById("xDoc").XMLDocument.async = false;
		document.getElementById("xDoc").XMLDocument.load(pDom);
	}
	catch (e)
	{
		alert("지원되지 않는 브라우저입니다. Internet Explorer 로 접속하여 주십시오.      ");
	}
}

function getValue(pName,pIndex)
{
	if (pIndex =="")
	{
		pIndex = 0;
	}
	
	return xmlDoc.getElementsByTagName(pName).item(pIndex).text;	
}

function getDomLength(pName,pDom)
{
	try
	{
		return pDom.getElementsByTagName(pName).length;	
	}
	catch (e)
	{
		return xmlDoc.getElementsByTagName(pName).length;
	}
}

function setSearchValue(pForm)
{
	theForm.searchValue.value = "";
	theForm.searchValue.value =formData2SearchValue(pForm);
}

var checkBoxCount = 0;

function formData2SearchValue(docForm) {

	var strSubmitContent = '';
	var formElem;
	var strLastElemName = '';
	
	for (i = 0; i < docForm.elements.length; i++) {
		
		formElem = docForm.elements[i];

		if(formElem.name !="searchValue")
		{
			switch (formElem.type)
			{
				// Text fields, hidden form elements
				case 'text':
				case 'hidden':
				case 'password':
				case 'textarea':
				case 'select-one':
					strSubmitContent += formElem.name + '=' + encodeURIComponent(formElem.value) + '&'
					break;
					
				// Radio buttons
				case 'radio':
					if (formElem.checked)
					{
						strSubmitContent += formElem.name + '=' + encodeURIComponent(formElem.value) + '&'
					}
					break;
					
				// Checkboxes
				case 'checkbox':
					if (formElem.checked) 
					{
						/*
						// Continuing multiple, same-name checkboxes
						if (formElem.name == strLastElemName) 
						{
							// Strip of end ampersand if there is one
							if (strSubmitContent.lastIndexOf('=') == strSubmitContent.length-1) 
							{
								strSubmitContent = strSubmitContent.substr(0, strSubmitContent.length - 1);
							}
							// Append value as comma-delimited string
							strSubmitContent += '=' + escape(formElem.value);
						}
						else 
						{
							strSubmitContent += formElem.name + '=' + escape(formElem.value);
						}
						
						strSubmitContent += ',';
						strLastElemName = formElem.name;
						*/
						strSubmitContent += formElem.name + '=' + encodeURIComponent(formElem.value) + '&'
						checkBoxCount++;
					}
		//			else
	//				{
//						strSubmitContent += formElem.name + '=' + escape(formElem.value) + ','
					//}
					break;
			}
		}
	}
	
	// Remove trailing separator
	strSubmitContent = strSubmitContent.substr(0, strSubmitContent.length - 1);
	return strSubmitContent;
}

//---------------------------------------------------XML Call 끝
