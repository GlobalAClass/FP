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
	<input type="button" id="searchEmp" class="btn btn-danger" value="직원 추가하기" style="margin-top: 20px;float: right;">
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

		
var params = 'substitute='+;
		$(document).ready(function() {	
			var SearchTable = $('#SearchTable').DataTable({
				"info": false,
				"ordering": false,
				"lengthMenu": [[5], [5]],
				"dom": '<"top"f>rt<"bottom"p><"clear">',
			    "ajax": {
		        	'url' : '/CheckMon/getRunList.do',
		       	 	'type' : 'POST',
		       	 	'data' : params
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
		        }else{
		            $('input[type=checkbox]').prop('checked',false);
		            $('#searchEmp').hide();
		        }
		    });

			//삭제 버튼 클릭 시 삭제할것이냐는 알림과 삭제 진행
		    $('#searchEmp').click(function(){
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
		            
		    });
		});
		// END CODE FOR Child rows (show extra / detailed information) DATA TABLE
	</script>