pragma solidity ^0.4.0;
contract ManageVendor{

	address public owner;
  

	struct Printer{

		string printerId ;
		string printerLocation;
		string printerStatus;
		
	}

	struct Vendor{

		string vendorId;
		string vendorName;
		string vendorLocation;
		string vendorEnrollmentDate;
		Printer[] printerList;
		
	}

    //Array to store list of Designers
	Vendor[] vendorList;

   //constructor
  function ManageVendor(){
    owner = msg.sender;
  }

  //Function to add new 3D vendor
  function addVendor(string vendorId, string vendorName, string vendorLocation, string vendorEnrollmentDate){
      
    vendorList.length++;
    uint temp = vendorList.length - 1;
  	vendorList[temp].vendorId = vendorId;
  	vendorList[temp].vendorName = vendorName;
  	vendorList[temp].vendorLocation = vendorLocation;
  	vendorList[temp].vendorEnrollmentDate = vendorEnrollmentDate;
  }

      //helper function
  function getVendorIndex(string vendorId) public constant returns(uint) {
    
      for(uint i=0;i<vendorList.length;i++){
        if(stringsEqual(vendorList[i].vendorId,vendorId)==true){
          return (i);
        }
      }
    
  }

    
  //Function to update Vendor Details
  function updateVendor(string vendorId, string vendorName, string vendorLocation, string vendorEnrollmentDate){

    uint i = getVendorIndex(vendorId);

  	vendorList[i].vendorName = vendorName;
  	vendorList[i].vendorLocation = vendorLocation;
  	vendorList[i].vendorEnrollmentDate = vendorEnrollmentDate;   	

  }

    //Function to get Vendor Information by Id
  function getVendorById(string vendorId) returns (string vendorName, string vendorLocation, string vendorEnrollmentDate){

    uint i = getVendorIndex(vendorId);
    
    vendorName = vendorList[i].vendorName;
    vendorLocation =vendorList[i].vendorLocation;
    vendorEnrollmentDate = vendorList[i].vendorEnrollmentDate;
  }

  //Function to get vendor Information for vendorList Array by index
  function getVendorByIndex(uint index) returns (string vendorId,string vendorName, string vendorLocation, string vendorEnrollmentDate) {

    vendorId=vendorList[index].vendorId;    
    vendorName = vendorList[index].vendorName;
    vendorLocation = vendorList[index].vendorLocation;
    vendorEnrollmentDate = vendorList[index].vendorEnrollmentDate;

  }
  

  //Function to assign a new printer to a vendor
  function assignPrinter(string vendorId, string printerId, string printerLocation, string printerStatus){

  	//We will look for a particular vendorId in our designerList array 
    uint i = getVendorIndex(vendorId);
	
  	vendorList[i].printerList.length++;
  	
  	uint temp = vendorList[i].printerList.length -1;
  	vendorList[i].printerList[temp].printerId = printerId;
  	vendorList[i].printerList[temp].printerLocation = printerLocation;
  	vendorList[i].printerList[temp].printerStatus = printerStatus;

  }

   //Function to remove printer of a vendor 
   function deassignPrinter(string vendorId,string printerId)
   {
      
      uint i = getVendorIndex(vendorId);

      
       uint length=vendorList[i].printerList.length;
       
       for(uint j=0;j<length;j++)
       {
           if(stringsEqual(vendorList[i].printerList[j].printerId,printerId)==true)
          {
              //update that with last and delete last one.
              
             vendorList[i].printerList[j].printerId=vendorList[i].printerList[length-1].printerId;
             vendorList[i].printerList[j].printerLocation=vendorList[i-1].printerList[length-1].printerLocation; 
             vendorList[i].printerList[j].printerStatus=vendorList[i-1].printerList[length-1].printerStatus; 
             delete(vendorList[i].printerList[length-1]);
             vendorList[i].printerList.length=length-1;
             break;
          }
  
       }
       
   }
    
  //function to get printer by index of a vendor
   function getPrinterByIndexForVendorId(uint index, string vendorId) returns (string printerId, string printerLocation, string printerStatus){

    uint i = getVendorIndex(vendorId);
		    
	  printerId = vendorList[i].printerList[index].printerId ;
		printerLocation =vendorList[i].printerList[index].printerLocation  ;
		printerStatus = vendorList[i].printerList[index].printerStatus; 
    
        
    }
    
    //function to get all printers by a vendor.
    function getAllPrintersByVendor(string vendorId) returns (string)
    {
       uint i = getVendorIndex(vendorId);

       var output ="";
       for(uint j=0;j<vendorList[i].printerList.length;++j)
       {
       var delimiter="||"   ;
       output=strConcat(output,vendorList[i].printerList[j].printerId,delimiter);
       output=strConcat(output,vendorList[i].printerList[j].printerLocation,delimiter);
       output=strConcat(output,vendorList[i].printerList[j].printerStatus,delimiter);
       }
       return output;
  
    }

    function stringsEqual(string storage _a, string memory _b) internal returns (bool) {
	 	bytes storage a = bytes(_a);
	 	bytes memory b = bytes(_b);
	 	if (a.length != b.length) return false;
	 	for (uint i = 0;i < a.length;i++) if (a[i] != b[i]) return false;
	 		return true;
	  }
  
    //function to concatenate three strings.
  
    function strConcat(string _a, string _b,string _c) internal returns (string){
      bytes memory _ba = bytes(_a);
      bytes memory _bb = bytes(_b);
      bytes memory _bc = bytes(_c);
      
      string memory abc = new string(_ba.length + _bb.length+_bc.length );
      bytes memory babc = bytes(abc);
      uint k = 0;
      for (uint i = 0; i < _ba.length; i++) babc[k++] = _ba[i];
      
      for (i = 0; i < _bb.length; i++) babc[k++] = _bb[i];
      
      for (i = 0; i < _bc.length; i++) babc[k++] = _bc[i];
      
      return string(babc);
      }
    
}  
