import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.bzstudio.mathblitz"
            resValue(type = "string", name = "app_name", value = "МатБлиц")
        }
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.bzstudio.mathblitz.dev"
            resValue(type = "string", name = "app_name", value = "МатБлиц Dev")
        }
        create("stage") {
            dimension = "flavor-type"
            applicationId = "com.bzstudio.mathblitz.stage"
            resValue(type = "string", name = "app_name", value = "МатБлиц Stage")
        }
    }
}