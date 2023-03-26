; ModuleID = 'src/misc/syscall.c'
source_filename = "src/misc/syscall.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind optsize strictfp
define i64 @syscall(i64 noundef %0, ...) local_unnamed_addr #0 {
  %2 = alloca [1 x %struct.__va_list_tag], align 16
  %3 = bitcast [1 x %struct.__va_list_tag]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %3) #4
  call void @llvm.va_start(i8* nonnull %3) #5
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %5 = load i32, i32* %4, align 16
  %6 = icmp ult i32 %5, 41
  br i1 %6, label %13, label %7

7:                                                ; preds = %1
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %9 = load i8*, i8** %8, align 8
  %10 = getelementptr i8, i8* %9, i64 8
  store i8* %10, i8** %8, align 8
  %11 = bitcast i8* %9 to i64*
  %12 = load i64, i64* %11, align 8
  br label %22

13:                                               ; preds = %1
  %14 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %15 = load i8*, i8** %14, align 16
  %16 = zext i32 %5 to i64
  %17 = getelementptr i8, i8* %15, i64 %16
  %18 = add nuw nsw i32 %5, 8
  store i32 %18, i32* %4, align 16
  %19 = bitcast i8* %17 to i64*
  %20 = load i64, i64* %19, align 8
  %21 = icmp ult i32 %5, 33
  br i1 %21, label %29, label %22

22:                                               ; preds = %13, %7
  %23 = phi i64 [ %12, %7 ], [ %20, %13 ]
  %24 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %25 = load i8*, i8** %24, align 8
  %26 = getelementptr i8, i8* %25, i64 8
  store i8* %26, i8** %24, align 8
  %27 = bitcast i8* %25 to i64*
  %28 = load i64, i64* %27, align 8
  br label %38

29:                                               ; preds = %13
  %30 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %31 = load i8*, i8** %30, align 16
  %32 = zext i32 %18 to i64
  %33 = getelementptr i8, i8* %31, i64 %32
  %34 = add nuw nsw i32 %5, 16
  store i32 %34, i32* %4, align 16
  %35 = bitcast i8* %33 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = icmp ult i32 %5, 25
  br i1 %37, label %46, label %38

38:                                               ; preds = %29, %22
  %39 = phi i64 [ %28, %22 ], [ %36, %29 ]
  %40 = phi i64 [ %23, %22 ], [ %20, %29 ]
  %41 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %42 = load i8*, i8** %41, align 8
  %43 = getelementptr i8, i8* %42, i64 8
  store i8* %43, i8** %41, align 8
  %44 = bitcast i8* %42 to i64*
  %45 = load i64, i64* %44, align 8
  br label %55

46:                                               ; preds = %29
  %47 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %48 = load i8*, i8** %47, align 16
  %49 = zext i32 %34 to i64
  %50 = getelementptr i8, i8* %48, i64 %49
  %51 = add nuw nsw i32 %5, 24
  store i32 %51, i32* %4, align 16
  %52 = bitcast i8* %50 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = icmp ult i32 %5, 17
  br i1 %54, label %64, label %55

55:                                               ; preds = %46, %38
  %56 = phi i64 [ %45, %38 ], [ %53, %46 ]
  %57 = phi i64 [ %40, %38 ], [ %20, %46 ]
  %58 = phi i64 [ %39, %38 ], [ %36, %46 ]
  %59 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %60 = load i8*, i8** %59, align 8
  %61 = getelementptr i8, i8* %60, i64 8
  store i8* %61, i8** %59, align 8
  %62 = bitcast i8* %60 to i64*
  %63 = load i64, i64* %62, align 8
  br label %73

64:                                               ; preds = %46
  %65 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %66 = load i8*, i8** %65, align 16
  %67 = zext i32 %51 to i64
  %68 = getelementptr i8, i8* %66, i64 %67
  %69 = add nuw nsw i32 %5, 32
  store i32 %69, i32* %4, align 16
  %70 = bitcast i8* %68 to i64*
  %71 = load i64, i64* %70, align 8
  %72 = icmp ult i32 %5, 9
  br i1 %72, label %83, label %73

73:                                               ; preds = %64, %55
  %74 = phi i64 [ %63, %55 ], [ %71, %64 ]
  %75 = phi i64 [ %58, %55 ], [ %36, %64 ]
  %76 = phi i64 [ %57, %55 ], [ %20, %64 ]
  %77 = phi i64 [ %56, %55 ], [ %53, %64 ]
  %78 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %79 = load i8*, i8** %78, align 8
  %80 = getelementptr i8, i8* %79, i64 8
  store i8* %80, i8** %78, align 8
  %81 = bitcast i8* %79 to i64*
  %82 = load i64, i64* %81, align 8
  br label %98

83:                                               ; preds = %64
  %84 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %85 = load i8*, i8** %84, align 16
  %86 = zext i32 %69 to i64
  %87 = getelementptr i8, i8* %85, i64 %86
  %88 = add nuw nsw i32 %5, 40
  store i32 %88, i32* %4, align 16
  %89 = bitcast i8* %87 to i64*
  %90 = load i64, i64* %89, align 8
  %91 = icmp eq i32 %5, 0
  br i1 %91, label %92, label %98

92:                                               ; preds = %83
  %93 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %94 = load i8*, i8** %93, align 16
  %95 = zext i32 %88 to i64
  %96 = getelementptr i8, i8* %94, i64 %95
  %97 = add nuw nsw i32 %5, 48
  store i32 %97, i32* %4, align 16
  br label %107

98:                                               ; preds = %73, %83
  %99 = phi i64 [ %82, %73 ], [ %90, %83 ]
  %100 = phi i64 [ %77, %73 ], [ %53, %83 ]
  %101 = phi i64 [ %76, %73 ], [ %20, %83 ]
  %102 = phi i64 [ %75, %73 ], [ %36, %83 ]
  %103 = phi i64 [ %74, %73 ], [ %71, %83 ]
  %104 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %105 = load i8*, i8** %104, align 8
  %106 = getelementptr i8, i8* %105, i64 8
  store i8* %106, i8** %104, align 8
  br label %107

107:                                              ; preds = %98, %92
  %108 = phi i64 [ %90, %92 ], [ %99, %98 ]
  %109 = phi i64 [ %53, %92 ], [ %100, %98 ]
  %110 = phi i64 [ %20, %92 ], [ %101, %98 ]
  %111 = phi i64 [ %36, %92 ], [ %102, %98 ]
  %112 = phi i64 [ %71, %92 ], [ %103, %98 ]
  %113 = phi i8* [ %96, %92 ], [ %105, %98 ]
  %114 = bitcast i8* %113 to i64*
  %115 = load i64, i64* %114, align 8
  call void @llvm.va_end(i8* nonnull %3) #5
  %116 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},{r9},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 %0, i64 %110, i64 %111, i64 %109, i64 %112, i64 %108, i64 %115) #4, !srcloc !3
  %117 = call i64 @__syscall_ret(i64 noundef %116) #6
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %3) #4
  ret i64 %117
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #2

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 76189}
