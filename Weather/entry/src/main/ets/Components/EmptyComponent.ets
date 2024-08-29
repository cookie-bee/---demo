
@Component
export struct EmptyComponent {

  build() {
    Column(){

      Text("")

    }
    .width("100%")
    .height("10%")
    .backgroundColor("rgba(0,0,0,0)")
  }

}