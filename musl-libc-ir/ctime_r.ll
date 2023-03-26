; ModuleID = 'src/time/ctime_r.c'
source_filename = "src/time/ctime_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

; Function Attrs: nounwind optsize strictfp
define i8* @ctime_r(i64* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.tm, align 8
  %4 = bitcast %struct.tm* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %4) #3
  %5 = call %struct.tm* @localtime_r(i64* noundef %0, %struct.tm* noundef nonnull %3) #4
  %6 = icmp eq %struct.tm* %5, null
  br i1 %6, label %9, label %7

7:                                                ; preds = %2
  %8 = call i8* @asctime_r(%struct.tm* noundef nonnull %5, i8* noundef %1) #4
  br label %9

9:                                                ; preds = %2, %7
  %10 = phi i8* [ %8, %7 ], [ null, %2 ]
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %4) #3
  ret i8* %10
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare %struct.tm* @localtime_r(i64* noundef, %struct.tm* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @asctime_r(%struct.tm* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
