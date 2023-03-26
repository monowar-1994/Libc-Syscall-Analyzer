; ModuleID = 'src/unistd/ualarm.c'
source_filename = "src/unistd/ualarm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.itimerval = type { %struct.timeval, %struct.timeval }
%struct.timeval = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @ualarm(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.itimerval, align 8
  %4 = alloca %struct.itimerval, align 8
  %5 = bitcast %struct.itimerval* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %5) #3
  %6 = getelementptr inbounds %struct.itimerval, %struct.itimerval* %3, i64 0, i32 0, i32 0
  store i64 0, i64* %6, align 8, !tbaa !3
  %7 = getelementptr inbounds %struct.itimerval, %struct.itimerval* %3, i64 0, i32 0, i32 1
  %8 = zext i32 %1 to i64
  store i64 %8, i64* %7, align 8, !tbaa !8
  %9 = getelementptr inbounds %struct.itimerval, %struct.itimerval* %3, i64 0, i32 1, i32 0
  store i64 0, i64* %9, align 8, !tbaa !3
  %10 = getelementptr inbounds %struct.itimerval, %struct.itimerval* %3, i64 0, i32 1, i32 1
  %11 = zext i32 %0 to i64
  store i64 %11, i64* %10, align 8, !tbaa !8
  %12 = bitcast %struct.itimerval* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %12) #3
  %13 = call i32 @setitimer(i32 noundef 0, %struct.itimerval* noundef nonnull %3, %struct.itimerval* noundef nonnull %4) #4
  %14 = getelementptr inbounds %struct.itimerval, %struct.itimerval* %4, i64 0, i32 1, i32 0
  %15 = load i64, i64* %14, align 8, !tbaa !9
  %16 = mul nsw i64 %15, 1000000
  %17 = getelementptr inbounds %struct.itimerval, %struct.itimerval* %4, i64 0, i32 1, i32 1
  %18 = load i64, i64* %17, align 8, !tbaa !11
  %19 = add nsw i64 %16, %18
  %20 = trunc i64 %19 to i32
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %12) #3
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %5) #3
  ret i32 %20
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @setitimer(i32 noundef, %struct.itimerval* noundef, %struct.itimerval* noundef) local_unnamed_addr #2

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
!3 = !{!4, !5, i64 0}
!4 = !{!"timeval", !5, i64 0, !5, i64 8}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!4, !5, i64 8}
!9 = !{!10, !5, i64 16}
!10 = !{!"itimerval", !4, i64 0, !4, i64 16}
!11 = !{!10, !5, i64 24}
