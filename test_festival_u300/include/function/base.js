//----------------------------------------문자열 관련--
//문자열 추가 프로퍼티...
var StringBuilder = function(){ 
    this.buffer = new Array();  
} 

//순서대로 문자열을 추가한다.
StringBuilder.prototype.Append = function( strValue ) { 
        this.buffer[this.buffer.length] = strValue;
       // this.buffer.push( strValue ); //IE5.5 NS4
} 

// 문자열의 형식을 지정해서 추가한다. 
StringBuilder.prototype.AppendFormat = function()
{ 
    var count = arguments.length;
    if( count < 2 ) return ""; 
    var strValue = arguments[0];
    for(var i=1; i<count; i++) 
          strValue = strValue.replace("{"+ (i-1) + "}", arguments[i] );
    this.buffer[this.buffer.length] = strValue;
} 


// 해당하는 위치에 문자열을 추가한다. (문자위치가 아님);
StringBuilder.prototype.Insert = function( idx, strValue ) { 
    this.buffer.splice( idx, 0, strValue );     //IE5.5 NS4 
}


// 해당문자열을 새로운 문자열로 바꾼다. 
// (배열방 단위로 바꾸므로 배열방 사이에 낀 문자열은 바꾸지 않음)
StringBuilder.prototype.Replace = function( from, to ) { 
    for( var i=this.buffer.length-1; i>=0; i--)
        this.buffer[i] = this.buffer[i].replace(new RegExp(from, "g"), to); //IE4  NS3 
}


// 문자열로 반환한다.
StringBuilder.prototype.ToString = function() { 
        return this.buffer.join("");    //IE4 NS3
} 
//----------------------------------------문자열 관련 끝--
//-------------------------------------fade 효과
var fadeOpacity = 0 ;
var tid;
function fadein() 
{
	try
	{
		fadeOpacity = 0;
		fin.filters.alpha.opacity = 0;
		clearInterval(tid);	
		tid = setInterval("fade()", 1); 	
	}
	catch (e)
	{}
	
}

function fade()
{
	if (fin.filters.alpha.opacity < 100 )
	{
		fadeOpacity = fadeOpacity + 16;
		fin.filters.alpha.opacity = fadeOpacity;
	}	
	else
	{
		fadeOpacity = 0 ;
		fin.filters.alpha.opacity = 100;
		clearInterval(tid);
	}
}
//-------------------------------------fade 효과 끝
//-------------------------------------프레임만들기
function makeExecFrame()
{
	try
	{
		var execFrmSrc = execFrm.src;
	}
	catch (e)
	{
		document.body.insertAdjacentHTML("beforeEnd", "<iframe id=execFrm name=execFrm frameborder=0 scrolling=yes width=100% height=600></iframe>");
	}
}
//-------------------------------------프레임만들기 끝
//-------------------------------------쿠키가져오기
function getCookie(name)
{
	var Found = false;
	var start, end;
	var i = 0;

	while(i <= document.cookie.length)
	{
		start = i;
		end = start + name.length;
		if(document.cookie.substring(start, end) == name)
		{
			Found = true;
			break;
		}
		i++;
	}
	if(Found == true)
	{
		start = end + 1;
		end = document.cookie.indexOf(';', start);
		if (end < start) end = document.cookie.length;
		return document.cookie.substring(start, end);
	}
	return '';
}
//-------------------------------------쿠키가져오기끝
//-------------------------------------쿠키세팅하기
function setCookie(name, value, expiredays)
{
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
}
//-------------------------------------쿠키세팅하기끝
function iframe_autosize(org){
	org.height=eval(org.name+".document.body.scrollHeight");
}