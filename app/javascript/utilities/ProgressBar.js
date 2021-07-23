export class ProgressBar {
  constructor(progressBarId) {
    this.progressBarId = document.getElementById(progressBarId)
    this.progressBarValue = document.querySelector('.progress-bar-value')
    this.currentQuestionNumber = this.progressBarValue.dataset.currentQuestionNumber
    this.questionsNumber = this.progressBarValue.dataset.questionsNumber
    this.progressBar = document.querySelector('.progress-bar')

    this.updateBar()
  }

  updateBar() {
    const PROGRESS = ((this.currentQuestionNumber - 1) / this.questionsNumber) * 100

    this.progressBar.style.width = '' + PROGRESS + '%'
    this.progressBarValue.textContent = '' + PROGRESS + '%'
  }
}
