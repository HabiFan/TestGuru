
export class SortedTable {
  constructor(table) {
    table.addEventListener('click', this.sortRowsByTitle)
  }

  sortRowsByTitle() {
    const table = document.querySelector('table')
    const sortedRows = Array.from(table.rows).slice(1)

    if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
      sortedRows.sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? 1 : -1)
      this.querySelector('.octicon-arrow-up').classList.remove('hide')
      this.querySelector('.octicon-arrow-down').classList.add('hide')
    } 
    else {
      sortedRows.sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? -1 : 1)
      this.querySelector('.octicon-arrow-up').classList.add('hide')
      this.querySelector('.octicon-arrow-down').classList.remove('hide')
    }
    table.tBodies[0].append(...sortedRows)
  }
}
