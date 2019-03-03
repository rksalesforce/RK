@isTest
public class VendorUpload_Controller_test {
    static testmethod void importCSVFile_test(){
       Vendor__C v = new Vendor__C(name = 'test');
       insert v;
        VendorUpload_Controller vu = new VendorUpload_Controller();
        vu.importCSVFile();
    }
}