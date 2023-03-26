; ModuleID = 'src/thread/pthread_attr_init.c'
source_filename = "src/thread/pthread_attr_init.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_attr_t = type { %union.anon }
%union.anon = type { [7 x i64] }

@__default_stacksize = external hidden local_unnamed_addr global i32, align 4
@__default_guardsize = external hidden local_unnamed_addr global i32, align 4

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_attr_init(%struct.pthread_attr_t* noundef writeonly %0) local_unnamed_addr #0 {
  %2 = alloca [7 x i64], align 8
  %3 = bitcast [7 x i64]* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(56) %3, i8 0, i64 56, i1 false)
  %4 = bitcast %struct.pthread_attr_t* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %4, i8* nonnull align 8 %3, i64 56, i1 true), !tbaa.struct !3
  tail call void @__acquire_ptc() #4
  %5 = load i32, i32* @__default_stacksize, align 4, !tbaa !7
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %0, i64 0, i32 0, i32 0, i64 0
  store i64 %6, i64* %7, align 8, !tbaa !4
  %8 = load i32, i32* @__default_guardsize, align 4, !tbaa !7
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds %struct.pthread_attr_t, %struct.pthread_attr_t* %0, i64 0, i32 0, i32 0, i64 1
  store i64 %9, i64* %10, align 8, !tbaa !4
  tail call void @__release_ptc() #4
  ret i32 0
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: optsize
declare hidden void @__acquire_ptc() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden void @__release_ptc() local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 0, i64 56, !4, i64 0, i64 56, !4, i64 0, i64 56, !4}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
