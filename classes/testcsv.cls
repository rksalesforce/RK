public class testcsv {
 public transient String input { public get; private set; }
      public transient String fileName { public get; private set; }

      public void exportContent(){
           Map<String,String> params = ApexPages.currentPage().getParameters();

          // We expect to be handed POST variables called 'inputdata' and 'filename'
          fileName = params.get('filename');
          if (fileName == null) fileName = 'Data';

          input = params.get('inputdata');
          if (input == null) input = 'No data provided.';
     }
}