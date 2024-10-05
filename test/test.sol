// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HelloWorld {
    string strVar = "Hello World";

    struct Info {
        string phrase;
        uint256 id;
        address addr;
    }

    Info[] infos;

    mapping(uint256 id => Info) infoMapping;



    // 查看
    function sayHello(uint256 _id) public view returns(string memory) { 
        // for(uint256 i = 0; i < infos.length; i++) {
        //     if (infos[i].id == _id) {
        //         return addInfo(infos[i].phrase);
        //     }
        // }
        if (infoMapping[_id].addr == address(0x0)) {
            return addInfo(strVar);
        }
        return addInfo(infoMapping[_id].phrase);
    }

    // 修改
    function setHelloWorld(string memory newString, uint256 _id) public {
        Info memory info = Info(newString, _id, msg.sender);
        // infos.push(info);
        infoMapping[_id] = info;
    }

    // 计算
    function addInfo(string memory helloWorldStr) internal pure returns(string memory) {
        return string.concat(helloWorldStr,  " from Frank's contract");
    }
}
