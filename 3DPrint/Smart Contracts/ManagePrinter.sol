pragma solidity ^0.4.0;

contract ManagePrinter{

	address public owner;
  

	struct Transaction{

		string transactionId;
		string printerId;
		string vendorId;
		string designFileId;
		string printDate;
	}

	struct Printer{

		string printerId ;
		string printerLocation;
		string printerStatus;
		Transaction[] transactionList;		
	}

    //Array to store list of Printers
	Printer[] printerList;

   //constructor
    function ManagePrinter(){
	    owner = msg.sender;
  }

    //Function to add new 3D printer
    function addPrinter(string printerId,string printerLocation, string printerStatus){
        
        printerList.length++;
        uint temp = printerList.length - 1;
    	printerList[temp].printerId = printerId;
    	printerList[temp].printerLocation = printerLocation;
    	printerList[temp].printerStatus = printerStatus;
    }

          //helper function
  function getPrinterIndex(string printerId) public constant returns(uint) {
    
      for(uint i=0;i<printerList.length;i++){
        if(stringsEqual(printerList[i].printerId,printerId)==true){
          return (i);
        }
      }
    
  }

    
    //Function to update Printer Details
    function updatePrinter(string printerId,string printerLocation, string printerStatus){

	    uint i = getPrinterIndex(printerId);		
  	 	printerList[i].printerLocation = printerLocation;
    	printerList[i].printerStatus = printerStatus;
 
    }

    //Function to get Printer Information by Id
    function getPrinterById(string printerId) returns (string printerLocation, string printerStatus){

	    uint i = getPrinterIndex(printerId);		

  	 	printerLocation = printerList[i].printerLocation ;
    	printerStatus = printerList[i].printerStatus ;
    }

    //Function to get printer Information from printerList Array by index
    //In solidity we can't return an array, thats why we would be returning individual elements 
    function getPrinterByIndex(uint index) returns ( string printerLocation, string printerStatus ) {

  	 	printerLocation = printerList[index].printerLocation ;
    	printerStatus = printerList[index].printerStatus ;

    }

    //Function to add new print Transaction
    function addTransaction(string transactionId, string printerId,string vendorId,string designFileId,string printDate){

    	//We will look for a particular printerId in our printerList array 
	    uint i = getPrinterIndex(printerId);		

		printerList[i].transactionList.length++;
		// creating new transaction
		uint temp = printerList[i].transactionList.length -1;
		printerList[i].transactionList[temp].transactionId = transactionId;
		printerList[i].transactionList[temp].printerId = printerId;
		printerList[i].transactionList[temp].vendorId = vendorId;
		printerList[i].transactionList[temp].designFileId = designFileId;
		printerList[i].transactionList[temp].printDate = printDate;



    }

    // Helper function to retrieve all transactions for a particular printer
    // Solidity doesnt support returning an array 
    function getTransactionByIndexForPrinterId(uint index, string printerId) returns (string transactionId,string vendorId,string designFileId,string printDate){

	    uint i = getPrinterIndex(printerId);		
		    
	    transactionId = printerList[i].transactionList[index].transactionId ;
	    vendorId = printerList[i].transactionList[index].vendorId ;
	    designFileId = printerList[i].transactionList[index].designFileId ;
	    printDate = printerList[i].transactionList[index].printDate ;

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