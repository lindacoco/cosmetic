<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<style>
  #previewDiv{
    height: 350px;
  }
  .previewImg{
    width: 980px;
    height: 60px;
  }
    [type="date"] {
	background: #fff
		url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)
		97% 50% no-repeat;
	}
  	[type="date"]::-webkit-inner-spin-button {
		display: none;
	}

	[type="date"]::-webkit-calendar-picker-indicator {
		opacity: 0;
	}
	
	.ck-editor__editable_inline {
    min-height: 500px;
    max-width: 980px;
    }
   .ck-rounded-corners .ck.ck-editor__top .ck-sticky-panel .ck-toolbar{
    width: 980px;
  }

</style>
<script>
	$(function(){


		/*  var url = "${url2}";
		CKEDITOR.replace('content',{filebrowserUploadUrl:'${pageContext.request.contextPath}/manager/imageUpload'});
		CKEDITOR.config.width = '77em';
		CKEDITOR.config.height = '50em';  */
		
 		  ClassicEditor
	        .create( document.querySelector( '#detail' ) )
	        .catch( error => {
	            console.error( error );
	        } );  
		
		 /* ClassicEditor
		    .create( document.querySelector( '#detail' ), {
		        cloudServices: {
		            tokenUrl: 'https://example.com/cs-token-endpoint',
		            uploadUrl: 'https://your-organization-id.cke-cs.com/easyimage/upload/'
		        }
		  
		    } )
		   // .then( ... )
		    .catch( error => {
	            console.error( error );   */
	            
	         /*    ClassicEditor
	            .create( document.querySelector( '#detail' ),{  
	            	language: 'ko',        
	            	simpleUpload: {
	                    uploadUrl: '/imageUpload' 
	                }
	            } )
	            .catch( error => {
	                console.error( error );
	            } ); 
	             */
	         /*    ClassicEditor.create(document.querySelector("#detail"), {
	                simpleUpload: {
	                    uploadUrl: '${pageContext.request.contextPath}/imageUpload'
	                }
	            } )
	            .catch( error => {
	                console.error( error );
	            } ); */
	            
	            

	})
 	 class MyUploadAdapter {
	    constructor( loader ) {
	        // The file loader instance to use during the upload.
	        alert("오냐고");
	        this.loader = loader;
	    }

	    // Starts the upload process.
	    upload() {
	        return this.loader.file
	            .then( file => new Promise( ( resolve, reject ) => {
	                this._initRequest();
	                this._initListeners( resolve, reject, file );
	                this._sendRequest( file );
	            } ) );
	    }

	    // Aborts the upload process.
	    abort() {
	        if ( this.xhr ) {
	            this.xhr.abort();
	        }
	    }

	    // Initializes the XMLHttpRequest object using the URL passed to the constructor.
	    _initRequest() {
	        const xhr = this.xhr = new XMLHttpRequest();
           alert("뭐라도찍어");
	        // Note that your request may look different. It is up to you and your editor
	        // integration to choose the right communication channel. This example uses
	        // a POST request with JSON as a data structure but your configuration
	        // could be different.
	        xhr.open( 'POST', '${pageContext.request.contextPath}/imageUpload', true );
	        xhr.responseType = 'json';
	    }

	    // Initializes XMLHttpRequest listeners.
	    _initListeners( resolve, reject, file ) {
	        const xhr = this.xhr;
	        const loader = this.loader;
	        const genericErrorText = `업로드 실패`;

	        xhr.addEventListener( 'error', () => reject( genericErrorText ) );
	        xhr.addEventListener( 'abort', () => reject() );
	        xhr.addEventListener( 'load', () => {
	            const response = xhr.response;

	            // This example assumes the XHR server's "response" object will come with
	            // an "error" which has its own "message" that can be passed to reject()
	            // in the upload promise.
	            //
	            // Your integration may handle upload errors in a different way so make sure
	            // it is done properly. The reject() function must be called when the upload fails.
	            if ( !response || response.error ) {
	                return reject( response && response.error ? response.error.message : genericErrorText );
	            }

	            // If the upload is successful, resolve the upload promise with an object containing
	            // at least the "default" URL, pointing to the image on the server.
	            // This URL will be used to display the image in the content. Learn more in the
	            // UploadAdapter#upload documentation.
	            resolve( {
	                default: response.url
	            } );
	        } );

	        // Upload progress when it is supported. The file loader has the #uploadTotal and #uploaded
	        // properties which are used e.g. to display the upload progress bar in the editor
	        // user interface.
	        if ( xhr.upload ) {
	            xhr.upload.addEventListener( 'progress', evt => {
	                if ( evt.lengthComputable ) {
	                    loader.uploadTotal = evt.total;
	                    loader.uploaded = evt.loaded;
	                }
	            } );
	        }
	    }

	    // Prepares the data and sends the request.
	    _sendRequest( file ) {
	        // Prepare the form data.
	        const data = new FormData();

	        data.append( 'upload', file );

	        // Important note: This is the right place to implement security mechanisms
	        // like authentication and CSRF protection. For instance, you can use
	        // XMLHttpRequest.setRequestHeader() to set the request headers containing
	        // the CSRF token generated earlier by your application.

	        // Send the request.
	        this.xhr.send( data );
	    }
	}

	// ...

	function MyCustomUploadAdapterPlugin( editor ) { 
	    editor.plugins.get( 'FileRepository' ).createUploadAdapter = ( loader ) => {
	        // Configure the URL to the upload script in your back-end here!
	        return new MyUploadAdapter( loader );
	    };
	}

	// ...

	ClassicEditor
	    .create( document.querySelector( '#editor' ), {
	        extraPlugins: [ MyCustomUploadAdapterPlugin ],

	        // ...
	    } )
	    .catch( error => { alert("여긴가");
	        console.log( error );
	    } ); 
	    
/* 	    ClassicEditor
	    .create( editorElement, {
	        ckfinder: {
	            uploadUrl: '${pageContext.request.contextPath}/imageUpload'
	        }
	    } ) */
	   /*  .then( ... )
	    .catch( ... ); */

</script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">이벤트 등록</h3>
				</div>
				<form role="form" action="eventRegister" method="post" enctype="multipart/form-data" id="eventForm">
					<div class="box-body">
						<div class="form-group">
							<label>이벤트 번호</label>
							<input type="hidden" name="eno" class="form-control" value="${autoNo }" readonly="readonly" style="width:200px;">
							 <br><span style="margin-left:10px;">${autoNo }</span>
						</div>
						<div class="form-group">
							<label>이벤트 타이틀</label>
							<input type="text" name="etitle" class="form-control" style="width:980px;">
						</div>
							<!-- ckeditor -->
						<div class="form-group">
							<label>이벤트 내용</label>
						    <textarea name="econtent" id="detail"></textarea> 
						</div>
						<div class="form-group">
							<label>시작 날짜</label>
							<input type="date" name="estartdate" class="form-control" style="width:200px;" required="required">
						</div>
						<div class="form-group">
							<label>종료 날짜</label>
							<input type="date" name="eenddate" class="form-control" style="width:200px;" required="required">
						</div>
						<div class="form-group">
							<label>메인 사진</label>
							<input type="file" name="eventPic" id="file" required="required">
						</div>
						<div class="form-group" id="previewDiv">
							
						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">등록</button>
						    <button type="button" class="btn btn-primary" id="btnReturnToList">목록으로</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
      $("#file").change(function(){
    	 // var file = $(this)[0]; //$(this)[0] : javascript객체를 의미  제이쿼리의 0번째 정보는 자바스크립트가 가지고 있음
    	 
  
    	  console.log(file); 
    	  //파일 정보를 끄집어 내자 
    	  var file = $(this)[0].files[0]; //files가 배열이라 0을 넣어줌 배너 등록 페이지에서 필요한 건 단일 파일이기 때문 
    	  console.log(file); 
    	
    	  var reader = new FileReader();
    	  reader.readAsDataURL(file);
    	  reader.onload = function(e){ //.addEventListener("load",function(){}) - 여러개 이벤트를 넣을 수 있음 
    		  var $img = $("<img class='previewImg'>").attr("src",e.target.result); // == reader.result 같은 값이 넘어온다 
    		  $("#previewDiv").html($img);
    	  }
      })
      
        //리스트로 버튼 눌렀을 때 리스트로 돌아가기 
		$("#btnReturnToList").click(function(){
			location.href="${pageContext.request.contextPath}/eventList";
		})
   
  </script>
<%@ include file="../../include/footer.jsp"%>