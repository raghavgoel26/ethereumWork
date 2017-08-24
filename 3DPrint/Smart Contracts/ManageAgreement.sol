pragma solidity ^0.4.0;

contract ManageAgreement{

	address public owner;

	struct Agreement{

		bytes32 agreementId;//keeping it as bytes32 and not string prevents stack too deep error in string comparison in functions below
		string agreementStatus;
		string designerId;
		string vendorId;
		string designFileId;
		string printerId;
		string agreementStartDate;
		string agreementEndDate;
		uint allowedPrintTxns;
		uint actualPrintTxns;
		uint amountPerPrint;
		uint amountDue;
		uint amountPaid;
	}

	Agreement[] agreementList;

	   //constructor
    function ManageAgreement(){
	    owner = msg.sender;
    }

        //Function to create new agreement
    function createAgreement(bytes32 agreementId,string agreementStatus,string designerId,string vendorId,string designFileId,string printerId,string agreementStartDate,string agreementEndDate,uint allowedPrintTxns,uint actualPrintTxns,uint amountPerPrint,uint amountDue,uint amountPaid){
        
        agreementList.length++;
        uint temp = agreementList.length - 1;
    	agreementList[temp].agreementId = agreementId;
    	agreementList[temp].agreementStatus = agreementStatus;
    	agreementList[temp].designerId = designerId;
    	agreementList[temp].vendorId = vendorId;
    	agreementList[temp].designFileId = designFileId;
    	agreementList[temp].printerId = printerId;
    	agreementList[temp].agreementStartDate = agreementStartDate;    	
    	agreementList[temp].agreementEndDate = agreementEndDate;
    	agreementList[temp].allowedPrintTxns = allowedPrintTxns;
    	agreementList[temp].actualPrintTxns = actualPrintTxns;
    	agreementList[temp].amountPerPrint = amountPerPrint;
    	agreementList[temp].amountPaid = amountPaid;
    	agreementList[temp].amountDue = amountDue;
    }

    //helper function
 	function getAgreementmentIndex(bytes32 agreementId) public constant returns(uint) {
 		
			for(uint i=0;i<agreementList.length;i++){
				if(agreementList[i].agreementId == agreementId){
					return (i);
		 		}
		 	}
	 	
	}

        //Function to update Agreement
    function updateAgreement(bytes32 agreementId,string agreementStatus,string designerId,string vendorId,string designFileId,string printerId,string agreementStartDate,string agreementEndDate,uint allowedPrintTxns,uint actualPrintTxns,uint amountPerPrint,uint amountDue,uint amountPaid){

  		uint i = getAgreementmentIndex(agreementId);
  		
    	agreementList[i].agreementStatus = agreementStatus;
    	agreementList[i].designerId = designerId;
    	agreementList[i].vendorId = vendorId;
    	agreementList[i].designFileId = designFileId;
    	agreementList[i].printerId = printerId;
    	agreementList[i].agreementStartDate = agreementStartDate;    	
    	agreementList[i].agreementEndDate = agreementEndDate;
    	agreementList[i].allowedPrintTxns = allowedPrintTxns;
    	agreementList[i].actualPrintTxns = actualPrintTxns;
    	agreementList[i].amountPerPrint = amountPerPrint;
    	agreementList[i].amountPaid = amountPaid;
    	agreementList[i].amountDue = amountDue;

    }

        //Function to get Agreement Information by Id
    function getAgreementById(bytes32 agreementId) returns (string){

    	uint i = getAgreementmentIndex(agreementId);

       var output ="";
       var delimiter="||" ;
       output=strConcat(output,agreementList[i].agreementStatus,delimiter);
       output=strConcat(output,agreementList[i].designerId,delimiter);
       output=strConcat(output,agreementList[i].vendorId,delimiter);
       output=strConcat(output,agreementList[i].designFileId,delimiter);
       output=strConcat(output,agreementList[i].printerId,delimiter);   
       output=strConcat(output,agreementList[i].agreementStartDate,delimiter);
       output=strConcat(output,agreementList[i].agreementEndDate,delimiter);
       output=strConcat(output,uintToString(agreementList[i].allowedPrintTxns),delimiter);
       output=strConcat(output,uintToString(agreementList[i].actualPrintTxns),delimiter);  
       output=strConcat(output,uintToString(agreementList[i].amountPerPrint),delimiter);
       output=strConcat(output,uintToString(agreementList[i].amountDue),delimiter);
       output=strConcat(output,uintToString(agreementList[i].amountPaid),delimiter);
       
       return output;

	    // agreementStatus = agreementList[i].agreementStatus ;
    	// designerId = agreementList[i].designerId ;
    	// vendorId = agreementList[i].vendorId ;
    	// designFileId = agreementList[i].designFileId ;
    	// printerId = agreementList[i].printerId ;
    	// agreementStartDate = agreementList[i].agreementStartDate ;    	
    	// agreementEndDate = agreementList[i].agreementEndDate;

    }

    // function getAgreementById2(bytes32 agreementId) returns (uint allowedPrintTxns,uint actualPrintTxns,uint amountPerPrint,uint amountDue,uint amountPaid){

    // 	uint i = getAgreementmentIndex(agreementId);

    // 	allowedPrintTxns = agreementList[i].allowedPrintTxns ;
    // 	actualPrintTxns = agreementList[i].actualPrintTxns ;
    // 	amountPerPrint = agreementList[i].amountPerPrint ;
    // 	amountPaid = agreementList[i].amountPaid ;
    // 	amountDue = agreementList[i].amountDue ;

    // }

    function validateAgreement(bytes32 agreementId) returns (bool){

    	uint i = getAgreementmentIndex(agreementId);

    	return (stringsEqual(agreementList[i].agreementStatus,"ACTIVE"));
    }


    function updateAgreementStatus(bytes32 agreementId){

    	uint i = getAgreementmentIndex(agreementId);


    }

    //     //Function to get Agreement Information by DesignerId and index
    // function getAgreementByDesigner(string ) returns (string agreementStatus,string designerId,string vendorId,string designFileId,string printerId,string agreementStartDate,string agreementEndDate,uint allowedPrintTxns,uint actualPrintTxns,uint amountPerPrint,uint amountDue,uint amountPaid){

    // 	uint l = agreementList.length;
    //     for(uint i=0; i<l; ++i)
    //     {
    //       if(stringsEqual(agreementList[i].agreementId,agreementId)==true)
				//       break;
	   //  }
    // 	designerId = agreementList[i].designerId ;
    // 	vendorId = agreementList[i].vendorId ;
    // 	designFileId = agreementList[i].designFileId ;
    // 	printerId = agreementList[i].printerId ;
    // 	agreementStartDate = agreementList[i].agreementStartDate ;    	
    // 	agreementEndDate = agreementList[i].agreementEndDate;
    // 	allowedPrintTxns = agreementList[i].allowedPrintTxns ;
    // 	actualPrintTxns = agreementList[i].actualPrintTxns ;
    // 	amountPerPrint = agreementList[i].amountPerPrint ;
    // 	amountPaid = agreementList[i].amountPaid ;
    // 	amountDue = agreementList[i].amountDue ;

    // }





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

	    function uintToString(uint v) constant returns (string str) {
        uint maxlength = 100;
        bytes memory reversed = new bytes(maxlength);
        uint i = 0;
        while (v != 0) {
            uint remainder = v % 10;
            v = v / 10;
            reversed[i++] = byte(48 + remainder);
        }
        bytes memory s = new bytes(i + 1);
        for (uint j = 0; j <= i; j++) {
            s[j] = reversed[i - j];
        }
        str = string(s);
    }

  
}