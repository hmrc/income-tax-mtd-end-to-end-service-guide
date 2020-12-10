import play.sbt.PlayImport._
import sbt._

object AppDependencies {

  val bootStrapPlayVersion = "3.2.0"

  val compile = Seq(
    ws,
    "uk.gov.hmrc" %% "bootstrap-frontend-play-26" % bootStrapPlayVersion)

  val test = Seq(
    "org.pegdown" % "pegdown" % "1.6.0" % "test",
    "org.scalatest" %% "scalatest" % "3.2.3" % "test",
    "com.vladsch.flexmark" % "flexmark-all" % "0.36.8",
  )
}
