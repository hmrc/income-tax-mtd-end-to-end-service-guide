import play.sbt.PlayImport._
import sbt._

object AppDependencies {

  val bootStrapPlayVersion = "8.0.0"
  val compile              = Seq(ws, "uk.gov.hmrc" %% "bootstrap-frontend-play-30" % bootStrapPlayVersion)

  val test = Seq(
    "org.scalatest"       %% "scalatest"              % "3.2.15"             % "test",
    "uk.gov.hmrc"         %% "bootstrap-test-play-30" % bootStrapPlayVersion % "test",
    "com.vladsch.flexmark" % "flexmark-all"           % "0.64.6"             % "test"
  )

}
