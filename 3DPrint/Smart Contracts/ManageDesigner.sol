pragma solidity ^0.4.0;

contract ManageDesigner{

	address public owner;
  

	struct DesignFile{

		string designFileId;
		string designerId;
		string designFileData;
		string designFileValidityDate;
	}

	struct Designer{

		string designerId;
		string designerName;
		string designerLocation;
		string designerEnrollmentDate;
		DesignFile[] designFileList;
		
	}

    //Array to store list of Designers
	Designer[] designerList;

   //constructor
    function ManageDesigner(){
	    owner = msg.sender;
  }

    //Function to add new 3D designer/owner
    function addDesigner(string designerId, string designerName, string designerLocation, string designerEnrollmentDate){
        
        designerList.length++;
        uint temp = designerList.length - 1;
    	designerList[temp].designerId = designerId;
    	designerList[temp].designerName = designerName;
    	designerList[temp].designerLocation = designerLocation;
    	designerList[temp].designerEnrollmentDate = designerEnrollmentDate;
    }
    
    //Function to update Designer Details
    function updateDesigner(string designerId, string designerName, string designerLocation, string designerEnrollmentDate){

    	uint l = designerList.length;
    	for (uint i=0;i<l;++i)
    	{
    		if(stringsEqual(designerList[i].designerId,designerId)==true)
    			break;
    	}
		
		designerList[i].designerName = designerName;
		designerList[i].designerLocation = designerLocation;
		designerList[i].designerEnrollmentDate = designerEnrollmentDate;   	

    }

    //Function to get Designer Information by Id
    function getDesignerById(string designerId) returns (string designerName, string designerLocation, string designerEnrollmentDate){

    	uint l = designerList.length;
        for(uint i=0; i<l; ++i)
        {
          if(stringsEqual(designerList[i].designerId,designerId)==true)
				      break;
	    }

	    designerName = designerList[i].designerName;
	    designerLocation = designerList[i].designerLocation;
	    designerEnrollmentDate = designerList[i].designerEnrollmentDate;
    }

    //Function to get designer Information for designerList Array by index
    //In solidity we can't return an array, thats why we would be returning individual elements 
    function getDesignerByIndex(uint index) returns (string designerName, string designerLocation, string designerEnrollmentDate) {

	    designerName = designerList[index].designerName;
	    designerLocation = designerList[index].designerLocation;
	    designerEnrollmentDate = designerList[index].designerEnrollmentDate;

    }

    //Function to add new design file
    function addDesignFile(string designFileId, string designerId, string designFileData, string designFileValidityDate){

    	//We will look for a particular designerId in our designerList array 
		uint l = designerList.length;
	        for(uint i=0; i<l; ++i)
	        {
	          if(stringsEqual(designerList[i].designerId,designerId)==true)
					      break;
		    }

		designerList[i].designFileList.length++;
		// creating new design file
		uint temp = designerList[i].designFileList.length -1;
		designerList[i].designFileList[temp].designFileId = designFileId;
		designerList[i].designFileList[temp].designFileData = designFileData;
		designerList[i].designFileList[temp].designFileValidityDate = designFileValidityDate;

    }

    //funtion to update a data file
    function updateDesignFile(string designFileId, string designerId, string designFileData, string designFileValidityDate){

    	//First look for that designer in the designerList array
		uint l = designerList.length;
	        for(uint i=0; i<l; ++i)
	        {
	          if(stringsEqual(designerList[i].designerId,designerId)==true)
					      break;
		    }
		//Look for the particular designfile we want to update
	    uint l2 = designerList[i].designFileList.length;

	    for (uint j=0; j<l2; ++j)
	    {
          if(stringsEqual(designerList[i].designFileList[j].designFileId,designFileId)==true)
					      break;
	    }
	    //update file data
		designerList[i].designFileList[j].designFileData = designFileData;
		designerList[i].designFileList[j].designFileValidityDate = designFileValidityDate;
    }

    //Function to return designFile by Id
    function getDesignFileById(string designFileId, string designerId) returns (string designFileData, string designFileValidityDate){

    	uint l = designerList.length;
	        for(uint i=0; i<l; ++i)
	        {
	          if(stringsEqual(designerList[i].designerId,designerId)==true)
					      break;
		    }

	    uint l2 = designerList[i].designFileList.length;

	    for (uint j=0; j<l2; ++j)
	    {
          if(stringsEqual(designerList[i].designFileList[j].designFileId,designFileId)==true)
					      break;
	    }
		designFileData = designerList[i].designFileList[j].designFileData ;
		designFileValidityDate = designerList[i].designFileList[j].designFileValidityDate ;

    }

    // Helper function to retrieve all designFiles for a particular designer
    // Solidity doesnt support returning an array 
    function getDesignFileByIndexForDesignerId(uint index, string designerId) returns (string designFileId, string designFileData, string designFileValidityDate){

    	uint l = designerList.length;
	        for(uint i=0; i<l; ++i)
	        {
	          if(stringsEqual(designerList[i].designerId,designerId)==true)
					      break;
		    }
		    
	    designFileId = designerList[i].designFileList[index].designFileData ;
		designFileData = designerList[i].designFileList[index].designFileData ;
		designFileValidityDate = designerList[i].designFileList[index].designFileValidityDate ;

    }



    // utility function
	function getDesignerListLength() returns(uint l){
	     l=designerList.length;
	    }

    //utility function
 	function toAsciiString(address x) returns (string) {
		bytes memory s = new bytes(40);
		for (uint i = 0; i < 20; i++) {
			byte b = byte(uint8(uint(x) / (2**(8*(19 - i)))));
			byte hi = byte(uint8(b) / 16);
			byte lo = byte(uint8(b) - 16 * uint8(hi));
			s[2*i] = char(hi);
		  	s[2*i+1] = char(lo);
		}
		string memory temp = string(s);
		temp = strConcat(" 0x",temp,"");
		return temp;
	}

    //utility function
	
	function char(byte b) returns (byte c) {
		if (b < 10) return byte(uint8(b) + 0x30);
		else return byte(uint8(b) + 0x57);
	}

    //utility function
	
	function strConcat(string _a, string _c, string _b) internal returns(string) { 
		bytes memory _ba = bytes(_a);
		bytes memory _bb = bytes(_b);
		bytes memory _bc = bytes(_c);
		string memory abc = new string(_ba.length + _bb.length + _bc.length);
		bytes memory babc = bytes(abc);
		uint k = 0;
		for (uint i = 0; i < _ba.length; i++) babc[k++] = _ba[i];
		for (i = 0; i < _bc.length; i++) babc[k++] = _bc[i];
		for (i = 0; i < _bb.length; i++) babc[k++] = _bb[i];
		return string(babc);
	}

    //utility function
	
	function stringsEqual(string storage _a, string memory _b) internal returns (bool) {
	 	bytes storage a = bytes(_a);
	 	bytes memory b = bytes(_b);
	 	if (a.length != b.length) return false;
	 	for (uint i = 0;i < a.length;i++) if (a[i] != b[i]) return false;
	 		return true;
	}
	

}