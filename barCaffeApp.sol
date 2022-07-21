// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.8.0;

contract Porosia {
     struct Stoku {
        uint Kafet;
        uint Qaji;
        uint KafetShitura;
        uint QajiShitur;
    }

    Stoku stoku;
     function setStokun(uint _k, uint _q) public {
        stoku.Kafet = _k;
        stoku.Qaji = _q;
    }
   
     function KafetNeStok() view public returns (uint) {
        return stoku.Kafet - stoku.KafetShitura;
    }

     function QajiNeStok() view public returns (uint) {
        return stoku.Qaji - stoku.QajiShitur;
    }


    function porositKafet(uint a) public {
        stoku.KafetShitura += a;
    }

   function porositQajit(uint a) public {
        stoku.QajiShitur += a;
    } 

     function KafetEShitura() view public returns (uint) {
        return stoku.KafetShitura;
    }

     function QajiIShitur() view public returns (uint) {
        return stoku.QajiShitur;
    }

    //   function Qarkullimi() public view returns (uint) {
    //     return  (stoku.KafetShitura * 7/10) + (stoku.QajiShitur * 1/2);
    // }
     
}

 contract Sherbyesi is Porosia{
     struct Profili {
         string emri;
         uint id;
     }
     Profili profili;

    function getEmri() view public returns (string memory) {
        return profili.emri;
    }

      function setEmri(string memory _e)  public {
        profili.emri = _e;
    }


     function getId() view public returns (uint) {
        return profili.id;
    }

    function setId(uint _i) public {
        profili.id = _i;
    }

    uint local_kafet = KafetEShitura();
    function getKafetShitura() view internal returns (uint) {
        return local_kafet;
    }

     uint local_qaji = QajiIShitur();
    function getQajiShitur() view internal returns (uint) {
        return local_qaji;
    }

 }
contract Menagjeri is  Porosia{
    Porosia porosia = new Porosia();
    uint kafet = porosia.KafetEShitura();
    
    uint qaji = porosia.QajiIShitur();

    function Qarkullimi() public view returns (uint) {
        return  (kafet * 7/10) + (qaji * 1/2);
    }

}

