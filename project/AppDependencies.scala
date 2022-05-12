import play.sbt.PlayImport._
import sbt._

object AppDependencies {

  val bootStrapPlayVersion = "5.24.0"

  val compile = Seq(
    ws,
    "uk.gov.hmrc" %% "bootstrap-frontend-play-28" % bootStrapPlayVersion)

  val test = Seq(
    "org.scalatest" %% "scalatest" % "3.2.12" % "test",
    "com.vladsch.flexmark" % "flexmark-all" % "0.62.2"
  )
}
