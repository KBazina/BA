// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract StudentRecord {
    struct Student{
        string name;
        uint grade;
    }

    mapping ( uint => Student) public students;
    uint public count;

    function addStudent(string memory _name, uint _grade) public {
        students[count] = Student(_name, _grade);
        count++;
    }
    function getStudent(uint _id) public view returns (Student memory) {
            Student memory s = students[_id];
            return s;
    }
    function updateGrade(uint _id, uint _grade) public {
        require(
            _id <= count,
            "Nema tog ucenika!!"
        );
        Student memory s = students[_id];
        s.grade = _grade;
        students[_id]=s;
    }
}