/**
 * 
 */
$(function() {
	//전역변수선언
    var editor_object2 = [];
    var ctx2 = getContextPath();

    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object2,
        elPlaceHolder: "smarteditor2",
        sSkinURI: ctx2 + "/resources/smarteditor/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
            fOnBeforeUnload : function(){
                
            }
        }
    });
    
  //전송버튼 클릭이벤트
    $("#addBtn").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object2.getById["smarteditor2"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
        var el2 = document.createElement('html');
        el2.innerHTML = editor_object2.getById["smarteditor2"].elPlaceHolder.value;
        //폼 submit
        $("#frm").submit();
    });
    
    function getContextPath() {
    	return sessionStorage.getItem("contextpath");
    }
});