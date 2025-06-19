val appName = "income-tax-mtd-end-to-end-service-guide"

lazy val microservice = Project(appName, file("."))
  .enablePlugins(PlayScala, SbtDistributablesPlugin)
  .settings(
    libraryDependencies ++= AppDependencies.compile ++ AppDependencies.test,
    update / evictionWarningOptions := EvictionWarningOptions.default.withWarnScalaVersionEviction(false),
    majorVersion                    := 0,
    scalaVersion                    := "2.13.16",
    scalacOptions ++= Seq(
      "-Xfatal-warnings",
      "-Wconf:src=routes/.*:silent",
      "-feature"
    )
  )
