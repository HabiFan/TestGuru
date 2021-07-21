export class SortedTable {
  constructor(table_id) {
    this.table = document.getElementById(table_id)
    this.selectedNode = this.table.querySelector(".sort-by-title")
    this.rows = this.table.querySelectorAll('tr')
    this.sortedRows = []
    this.sortedTable = document.createElement('table')
    this.tblBody = document.createElement("tbody");
    this.arrowUp = this.selectedNode.querySelector('.octicon-arrow-up')
    this.arrowDown = this.selectedNode.querySelector('.octicon-arrow-down')

    this.setup()
  }

  setup() {
    const control = document.querySelector(".sort-by-title")

    if (control) control.addEventListener('click', event => {
      this.sortRowsByColumnName()
    })
  }

  sortRowsByColumnName() {
    const ColumnPos = this.selectedNode.cellIndex

    for (var i = 1; i < this.rows.length; i++) {
      this.sortedRows.push(this.rows[i])
    }

    if (this.arrowUp.classList.contains('hide')) {
      this.sortedRows.sort((rowA, rowB) => rowA.cells[ColumnPos].innerHTML > rowB.cells[ColumnPos].innerHTML ? 1 : -1)
      this.arrowUp.classList.remove('hide')
      this.arrowDown.classList.add('hide')
    } else {
      this.sortedRows.sort((rowA, rowB) => rowA.cells[ColumnPos].innerHTML > rowB.cells[ColumnPos].innerHTML ? -1 : 1)
      this.arrowDown.classList.remove('hide')
      this.arrowUp.classList.add('hide')
    }

    this.createSortedTable()
  }

  createSortedTable() {
    this.sortedTable.classList.add('table', 'table-bordered', 'mt-2')
    this.tblBody.appendChild(this.rows[0])

    for (var i = 0; i < this.sortedRows.length; i++) {
      this.tblBody.appendChild(this.sortedRows[i])
    }
    
    this.sortedTable.appendChild(this.tblBody)
    if (this.table.parentNode) this.table.parentNode.replaceChild(this.sortedTable, this.table)
  }
}