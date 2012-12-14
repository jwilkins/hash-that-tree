StandardTemplate =<<-TEMPLATE
File Hash\t\t\t\tFile Name\t\t\tFolder
{{#filedetails}}
{{filehash}}\t{{filename}}\t\t{{folder}}
{{/filedetails}} 
TEMPLATE

HtmlTemplate =<<-TEMPLATE
<!DOCTYPE html>
<html xmlns=\"http://www.w3.org/1999/xhtml\">
  <head>
    <title></title>
  </head>
  <body>
        <table>
            <tr>
                  <th>File Hash</th>
                  <th>File Name</th>
                  <th>Folder</th>
            </tr>
           {{#filedetails}}
            <tr>
                 <td>{{filehash}}</td>
                 <td>{{filename}}</td>
                 <td>{{folder}}</td>
            </tr>
            {{/filedetails}} 
        </table>
  </body>
</html>    
TEMPLATE

CsvTemplate=<<-TEMPLATE
File Hash,File Name,Folder,
{{#filedetails}}
{{filehash}},{{filename}},{{folder}},
{{/filedetails}} 
TEMPLATE
