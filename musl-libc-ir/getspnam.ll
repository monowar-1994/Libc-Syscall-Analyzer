; ModuleID = 'src/passwd/getspnam.c'
source_filename = "src/passwd/getspnam.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.spwd = type { i8*, i8*, i64, i64, i64, i64, i64, i64, i64 }

@getspnam.sp = internal global %struct.spwd zeroinitializer, align 8
@getspnam.line = internal unnamed_addr global i8* null, align 8

; Function Attrs: nounwind optsize strictfp
define %struct.spwd* @getspnam(i8* noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.spwd*, align 8
  %3 = bitcast %struct.spwd** %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %3) #4
  %4 = tail call i32* @___errno_location() #5
  %5 = load i32, i32* %4, align 4, !tbaa !3
  %6 = load i8*, i8** @getspnam.line, align 8, !tbaa !7
  %7 = icmp eq i8* %6, null
  br i1 %7, label %8, label %11

8:                                                ; preds = %1
  %9 = tail call i8* @malloc(i64 noundef 256) #6
  store i8* %9, i8** @getspnam.line, align 8, !tbaa !7
  %10 = icmp eq i8* %9, null
  br i1 %10, label %17, label %11

11:                                               ; preds = %1, %8
  %12 = phi i8* [ %9, %8 ], [ %6, %1 ]
  %13 = call i32 @getspnam_r(i8* noundef %0, %struct.spwd* noundef nonnull @getspnam.sp, i8* noundef nonnull %12, i64 noundef 256, %struct.spwd** noundef nonnull %2) #6
  %14 = icmp eq i32 %13, 0
  %15 = select i1 %14, i32 %5, i32 %13
  store i32 %15, i32* %4, align 4, !tbaa !3
  %16 = load %struct.spwd*, %struct.spwd** %2, align 8, !tbaa !7
  br label %17

17:                                               ; preds = %8, %11
  %18 = phi %struct.spwd* [ %16, %11 ], [ null, %8 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %3) #4
  ret %struct.spwd* %18
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @getspnam_r(i8* noundef, %struct.spwd* noundef, i8* noundef, i64 noundef, %struct.spwd** noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
