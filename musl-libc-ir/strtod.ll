; ModuleID = 'src/stdlib/strtod.c'
source_filename = "src/stdlib/strtod.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

; Function Attrs: nounwind optsize strictfp
define float @strtof(i8* noalias noundef %0, i8** noalias noundef %1) local_unnamed_addr #0 {
  %3 = tail call fastcc x86_fp80 @strtox(i8* noundef %0, i8** noundef %1, i32 noundef 0) #4
  %4 = tail call float @llvm.experimental.constrained.fptrunc.f32.f80(x86_fp80 %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  ret float %4
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc x86_fp80 @strtox(i8* noundef %0, i8** noundef writeonly %1, i32 noundef %2) unnamed_addr #0 {
  %4 = alloca %struct._IO_FILE, align 8
  %5 = bitcast %struct._IO_FILE* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 232, i8* nonnull %5) #6
  %6 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %4, i64 0, i32 1
  store i8* %0, i8** %6, align 8, !tbaa !3
  %7 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %4, i64 0, i32 11
  store i8* %0, i8** %7, align 8, !tbaa !10
  %8 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %4, i64 0, i32 2
  store i8* inttoptr (i64 -1 to i8*), i8** %8, align 8, !tbaa !11
  call void @__shlim(%struct._IO_FILE* noundef nonnull %4, i64 noundef 0) #7
  %9 = call x86_fp80 @__floatscan(%struct._IO_FILE* noundef nonnull %4, i32 noundef %2, i32 noundef 1) #7
  %10 = icmp eq i8** %1, null
  br i1 %10, label %21, label %11

11:                                               ; preds = %3
  %12 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %4, i64 0, i32 27
  %13 = load i64, i64* %12, align 8, !tbaa !12
  %14 = load i8*, i8** %6, align 8, !tbaa !3
  %15 = ptrtoint i8* %14 to i64
  %16 = load i8*, i8** %7, align 8, !tbaa !10
  %17 = ptrtoint i8* %16 to i64
  %18 = add i64 %13, %15
  %19 = sub i64 %18, %17
  %20 = getelementptr i8, i8* %0, i64 %19
  store i8* %20, i8** %1, align 8, !tbaa !13
  br label %21

21:                                               ; preds = %11, %3
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %5) #6
  ret x86_fp80 %9
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f80(x86_fp80, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define double @strtod(i8* noalias noundef %0, i8** noalias noundef %1) local_unnamed_addr #0 {
  %3 = tail call fastcc x86_fp80 @strtox(i8* noundef %0, i8** noundef %1, i32 noundef 1) #4
  %4 = tail call double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80 %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  ret double %4
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80, metadata, metadata) #1

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @strtold(i8* noalias noundef %0, i8** noalias noundef %1) local_unnamed_addr #0 {
  %3 = tail call fastcc x86_fp80 @strtox(i8* noundef %0, i8** noundef %1, i32 noundef 2) #4
  ret x86_fp80 %3
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare hidden void @__shlim(%struct._IO_FILE* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden x86_fp80 @__floatscan(%struct._IO_FILE* noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }
attributes #5 = { strictfp }
attributes #6 = { nounwind strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 8}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 88}
!11 = !{!4, !8, i64 16}
!12 = !{!4, !9, i64 200}
!13 = !{!8, !8, i64 0}
