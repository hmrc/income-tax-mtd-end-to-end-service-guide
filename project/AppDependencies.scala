import play.sbt.PlayImport._
import sbt._

object AppDependencies {

  val bootStrapPlayVersion = "5.7.0"

  val compile = Seq(
    ws,
    "uk.gov.hmrc" %% "bootstrap-frontend-play-28" % bootStrapPlayVersion)

  val test = Seq(
    "org.scalatest" %% "scalatest" % "3.2.9" % "test",
    "com.vladsch.flexmark" % "flexmark-all" % "0.36.8"
  )
}
