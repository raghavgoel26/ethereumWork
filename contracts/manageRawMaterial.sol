pragma solidity ^0.4.4;

contract Registry{

    enum shippedLocations { Pepe, Levis, JackNJones, Wrangler, Lee}
    enum materialStatusOptions {Ready, Consumed}
    
    struct billOfSupply{

        uint materialId;    
        string materialName;
        uint materialQuantity;
        string materialOrigin;
        string materialZipcode;
        shippedLocations materialShippedTo;
        materialStatusOptions materialStaus;    
    }

    billOfSupply[] billsOfSupply;

    function createBillOfSupply(string name, uint quantity, string origin, string zipcode, uint8 shippedTo, uint8 status ){

        billOfSupply memory bos;
        bos.materialId = billsOfSupply.length;
        bos.materialName = name;
        bos.materialQuantity = quantity;
        bos.materialOrigin = origin;
        bos.materialZipcode = zipcode;
        bos.materialShippedTo = shippedLocations(shippedTo);
        bos.materialStaus = materialStatusOptions(status);

        billsOfSupply.push(bos);
    }

    function updateBillsOfSupply(uint mid, string name, uint quantity, string origin, string zipcode, uint8 shippedTo, uint8 status ){

        uint l = billsOfSupply.length;
        for(uint i=0; i<l; ++i)
        {
            if(billsOfSupply[i].materialId == mid)
             break;
        }
        billsOfSupply[i].materialId = billsOfSupply.length;
        billsOfSupply[i].materialName = name;
        billsOfSupply[i].materialQuantity = quantity;
        billsOfSupply[i].materialOrigin = origin;
        billsOfSupply[i].materialZipcode = zipcode;
        billsOfSupply[i].materialShippedTo = shippedLocations(shippedTo);
        billsOfSupply[i].materialStaus = materialStatusOptions(status);

    }

    function getBillOfSupplyById(uint id) returns(string materialName, uint materialQuantity, string materialOrigin, string materialZipcode, shippedLocations materialShippedTo, materialStatusOptions materialStatus  ){

        materialName = billsOfSupply[id].materialName ;
        materialQuantity = billsOfSupply[id].materialQuantity; 
        materialOrigin = billsOfSupply[id].materialOrigin;
        materialZipcode = billsOfSupply[id].materialZipcode; 
        materialShippedTo = billsOfSupply[id].materialShippedTo; 
        materialStatus = billsOfSupply[id].materialStaus ;
	  }

    // Throws error  "Internal type is not allowed for public or external functions."
    
    // function getAllBillsOfSupply() returns(billOfSupply[] bos){

    //     bos = billsOfSupply;
    // }

    function getLength() returns(uint l){
      l=billsOfSupply.length;
    }

}
