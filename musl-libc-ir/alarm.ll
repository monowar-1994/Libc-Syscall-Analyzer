; ModuleID = 'src/unistd/alarm.c'
source_filename = "src/unistd/alarm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.itimerval = type { %struct.timeval, %struct.timeval }
%struct.timeval = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @alarm(i32 noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.itimerval, align 8
  %3 = alloca %struct.itimerval, align 8
  %4 = bitcast %struct.itimerval* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %4) #4
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %4, i8 0, i64 32, i1 false) #5
  %5 = getelementptr inbounds %struct.itimerval, %struct.itimerval* %2, i64 0, i32 1, i32 0
  %6 = zext i32 %0 to i64
  store i64 %6, i64* %5, align 8, !tbaa !3
  %7 = bitcast %struct.itimerval* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %7) #4
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %7, i8 0, i64 32, i1 false) #5
  %8 = call i32 @setitimer(i32 noundef 0, %struct.itimerval* noundef nonnull %2, %struct.itimerval* noundef nonnull %3) #6
  %9 = getelementptr inbounds %struct.itimerval, %struct.itimerval* %3, i64 0, i32 1, i32 0
  %10 = load i64, i64* %9, align 8, !tbaa !8
  %11 = getelementptr inbounds %struct.itimerval, %struct.itimerval* %3, i64 0, i32 1, i32 1
  %12 = load i64, i64* %11, align 8, !tbaa !10
  %13 = icmp ne i64 %12, 0
  %14 = zext i1 %13 to i64
  %15 = add nsw i64 %10, %14
  %16 = trunc i64 %15 to i32
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %7) #4
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %4) #4
  ret i32 %16
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: optsize
declare i32 @setitimer(i32 noundef, %struct.itimerval* noundef, %struct.itimerval* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

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
!8 = !{!9, !5, i64 16}
!9 = !{!"itimerval", !4, i64 0, !4, i64 16}
!10 = !{!9, !5, i64 24}
