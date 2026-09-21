namespace student.db;

using {
    cuid,
    managed
} from '@sap/cds/common';

type nameType : String(50);

aspect customAspect {
    status : String;
}

entity Students {
    key studentID : UUID; //CAPM will create unique ID for this data
        name      : String(50); //Multiple key fields possible-  key name: String(50);
        address   : String; //default:255 in local, in HANA 5000
        email     : String(100);
        mobile    : String;
        age       : Integer;
        gender    : String;
}

entity Courses : cuid, managed {
    //key courseID : UUID;  ID will be the coloumn name and this will have a unique ID by aspects
    name     : nameType;
    cost     : Decimal(10, 2);
    trainer  : String;
    duration : Integer;


}

entity Address {
    key addressId   : Integer;
        description : String(100);
        city        : String;
        country     : String;
}

entity Books : cuid {
    name        : String;
    title       : String;
    publishedOn : String;
    //authorID: String; //Unmanaged
    author      : Association to Authors; //Managed Association- CAPM will create the colm
}

entity Authors : cuid {
    name  : String;
    books : Composition of many Books
                on books.author = $self;
   // books : Composition of many Books on books.authorID = Authors.ID; //ID is basically CUID
}
