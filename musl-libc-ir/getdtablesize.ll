; ModuleID = 'src/legacy/getdtablesize.c'
source_filename = "src/legacy/getdtablesize.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.rlimit = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @getdtablesize() local_unnamed_addr #0 {
  %1 = alloca %struct.rlimit, align 8
  %2 = bitcast %struct.rlimit* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %2) #3
  %3 = call i32 @getrlimit(i32 noundef 7, %struct.rlimit* noundef nonnull %1) #4
  %4 = getelementptr inbounds %struct.rlimit, %struct.rlimit* %1, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !3
  %6 = icmp ult i64 %5, 2147483647
  %7 = select i1 %6, i64 %5, i64 2147483647
  %8 = trunc i64 %7 to i32
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %2) #3
  ret i32 %8
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @getrlimit(i32 noundef, %struct.rlimit* noundef) local_unnamed_addr #2

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
!4 = !{!"rlimit", !5, i64 0, !5, i64 8}
!5 = !{!"long long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
