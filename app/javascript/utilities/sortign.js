import { SortedTable } from './SortedTable.js'

 document.addEventListener('turbolinks:load', function () {
   const table_id = "test_table"
   const table = document.getElementById(table_id)

   if (table_id != "") new SortedTable(table_id)
 })