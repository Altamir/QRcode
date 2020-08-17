extension DateTimeExtensions on DateTime {
  String toUI() {
    return "${this.day}/${this.month}/${this.year} ${this.hour}:${this.minute}";
  }
}
