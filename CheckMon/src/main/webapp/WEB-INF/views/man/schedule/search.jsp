<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div>
	<div class="table-responsive">
		<table id="SearchTable" class="table table-bordered table-hover display">
			<thead>
			<tr>
			<th><input type="checkbox" id="ck_all" value=""></th>
			<th></th>
			<th>그룹 명</th>
			<th>직원 이름</th>
			<th>직책</th>
			</tr>
			</thead>
		</table>
	</div>
	<div id="searchEmp"  align="center" >
	<h5>선택한 근무자에게 <b>대리근무 신청</b>을 보냅니다.</h5>
	<input type="button" class="btn btn-success btn-lg" style="margin-bottom:20px;" value="대리근무 신청하기" onclick="agreeVacation()">
	</div>
</div>
						
	<!-- END main -->

	
	<script src="assets/js/jquery.min.js"></script>

	<script>
	var selectEmp = "";
	
		$(function() { 
			$("input:text").keydown(function(evt) { 
				if (evt.keyCode == 13) return false; 
			}); 
		});

	
	
	function searchTableGet(params) {
			var SearchTable = $('#SearchTable').DataTable({
				"info": false,
				"ordering": false,
				"lengthMenu": [[5], [5]],
				"dom": '<"top"f>rt<"bottom"p><"clear">',
			    "ajax": {
		        	'url' : '/CheckMon/getRunListSubstitude.do',
		       	 	'type' : 'GET',
		       	 	'data' : {"subDate": params}
			    	},
				"columns" : [
					{
						"className" : 'check_group',
						"orderable" : false,
						"data" : null,
						"defaultContent" : '<input type="checkbox" name="checkRow" value="">',
						
					},
					{"data" : "imgpath", "orderable" : false},
					{"data" : "e_group"},
					{"data" : "e_name"},
					{"data" : "e_position"}
				],
				"order" : [ [ 1, 'asc' ] ]
			});
			
			
			//템플릿 삭제하기 버튼 숨기기
			$('#searchEmp').hide();
			
			//체크 박스 개별 선택&해제시 삭제버튼 숨기고 나타내는 코드
			$('#SearchTable').on('click','input[name=checkRow]',function(){
				
				var emp_ix = "";
	        	var len = $("input[name=checkRow]:checked").size();
	            $("input[name=checkRow]:checked").each(function(i){
					if(i>0 && i< len){
						emp_ix += ',';
	            	}
					var row = SearchTable.row($(this).closest('tr'));
	            	emp_ix += row.data().emp_ix;
	            });
	           selectEmp = emp_ix; //체크박스 선택한 인원으로 함수 실행.
				
				if($('input[name="checkRow"]').is(":checked")==true){
					$('#searchEmp').show();
				}else{
					$('#searchEmp').hide();
				}
			})
			
		    //체크박스 전체 선택&해제 and 삭제버튼 숨기고 나타내는 코드
		    $('#ck_all').click(function(){
		         if($('#ck_all').prop('checked')){
		            $("input[type=checkbox]").prop('checked',true);
		            $('#searchEmp').show();
		            
		            var emp_ix = "";
		        	var len = $("input[name=checkRow]:checked").size();
		            $("input[name=checkRow]:checked").each(function(i){
						if(i>0 && i< len){
							emp_ix += ',';
		            	}
						var row = SearchTable.row($(this).closest('tr'));
		            	emp_ix += row.data().emp_ix;
		            });
		           selectEmp = emp_ix; //체크박스 선택한 인원으로 함수 실행.
		            
		        }else{
		            $('input[type=checkbox]').prop('checked',false);
		            $('#searchEmp').hide();
		        }
		    });
		
	}
	
	
		// END CODE FOR Child rows (show extra / detailed information) DATA TABLE
	</script>