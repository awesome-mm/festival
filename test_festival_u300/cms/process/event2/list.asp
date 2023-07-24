<!-- #include virtual="/cms/sub_top.asp" -->

<%

	s_date = "2022-08-15 23:59"
	e_date = "2022-08-25 23:59"

%>

<script>

	function go_vote(){

		var logo_vote = $('input[name=logo_vote]').is(":checked");

		var obj_length = $("input:checkbox[name='logo_vote']:checked").length;

        //alert(obj_length);

		//alert(logo_vote);

		if(logo_vote == false){

			alert("투표할 항목을 선택해 주세요.");
			document.kdb.logo_vote.focus()
		
		}else{

			if(obj_length < 4){

				document.kdb.method = "post"
				document.kdb.action = "vote_ok.asp"
				document.kdb.submit()

			}else{

				alert("투표할 항목은 최대3개까지 입니다.")
			}
		}
	}






	function ch_vote(gubun){


		var id_checked = $('#logo_vote'+gubun).is(":checked");

		var obj_length = $("input:checkbox[name='logo_vote']:checked").length;

		//alert(id_checked);


		if(obj_length > 3){

			alert("투표할 항목은 최대3개까지 입니다.");

			$("#logo_vote"+gubun).prop("checked", false);

			return false;

		}


		if(id_checked){
			$("#b_logo_vote"+gubun).css("border", "5px solid #DE4251");
		}else{
			$("#b_logo_vote"+gubun).css("border", "1px solid #ff9000");
		}

	}

</script>


<form name="kdb"  onsubmit="return false;">


		<div class="event_wrapper">
				<div class="sub_title">
						<h2>로고 투표</h2>

				</div>


				<div style="text-align:center; margin-top:60px;">
					<span class="co666"><img src="/cms/process/event2/img/top.png" style="width:70%;height:auto;"></span>
				</div>


			<div class="event">

				<div class="event_wrap">

				

					<% for i=1 to 69 step 1 %>

						<div>
							<label>

								<div class="event_box2" id="b_logo_vote<%=i%>">
									<img src="/cms/process/event2/img/<%=i%>.jpg" style="cursor:pointer;">
								</div>

								
								<div style="text-align:center;" >
										<input id="logo_vote<%=i%>" name="logo_vote" type="checkbox" value="<%=i%>" onclick="ch_vote('<%=i%>')";>
										<label for="logo_vote<%=i%>"><%=i%>번</label>
								</div>

							<label>
						</div>

					<% Next %>


					


<%if now() < cdate(e_date) then%>


				<div class="btn_box3 mgt70">
					<div class="btn_box3_txt">
						<a href="#" onclick="go_vote()">
							투표하기
						</a>
					</div>
				</div> 

<%End if%>


			</div>

		</div>

	</div>


</form>

<!-- #include virtual="/cms/sub_bottom.asp" -->
